from django.db import models
from django.utils.text import slugify
from django.utils.html import mark_safe
import shortuuid
from userauths.models import User
from shortuuid.django_fields import ShortUUIDField
from django_ckeditor_5.fields import CKEditor5Field

HOSTEL_STATUS = (
    ("draft", "draft"),
    ("disabled", "disabled"),
    ("rejected", "rejected"),
    ("In review", "In review"),
    ("Live", "Live"),
)

ICON_TYPE = (
    ("bootstrap Icon", "bootstrap Icon"),
    ("Fontawesome Icon", "Fontawesome Icon"),  # Fixed typo: Frontawsome -> Fontawesome
    ("Box Icon", "Box Icon"),
)

PAYMENT_STATUS = (
    ("paid", "paid"),
    ("pending", "pending"),
    ("processing", "processing"),  # Fixed typo: proceesing -> processing
    ("cancelled", "cancelled"),
    ("initiated", "initiated"),
    ("failed", "failed"),
    ("refunding", "refunding"),
    ("refunded", "refunded"),
    ("unpaid", "unpaid"),
    ("expired", "expired"),
)


class Hostel(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    name = models.CharField(max_length=100)
    description =CKEditor5Field(null=True, blank=True, config_name='extends')
    image = models.FileField(upload_to="hostel_gallery")
    address = models.CharField(max_length=200)
    mobile = models.CharField(max_length=200)
    email = models.EmailField(max_length=100)
    status = models.CharField(max_length=20, choices=HOSTEL_STATUS, default='Live')

    tags = models.CharField(max_length=200, help_text="separate tags with commas")
    views = models.IntegerField(default=0)
    featured = models.BooleanField(default=False)
    hid = ShortUUIDField(unique=True, length=10, max_length=20, alphabet="abcdefghijklmnopqrstuvwxy")
    slug = models.SlugField(unique=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
    
    def save(self, *args, **kwargs):
        if not self.slug:
            uuid_key = shortuuid.uuid()
            uniqueid = uuid_key[:4]
            self.slug = slugify(self.name) + '-' + uniqueid.lower()
        super(Hostel, self).save(*args, **kwargs)

    def thumbnail(self):
        return mark_safe("<img src='%s' width='50' style='object-fit: cover; border-radius:6px;'/>" % (self.image.url))


class HostelGallery(models.Model):
    hostel = models.ForeignKey(Hostel, on_delete=models.CASCADE)  # Fixed typo: hotel -> hostel
    image = models.FileField(upload_to="hostel_gallery")
    hgid = ShortUUIDField(unique=True, length=10, max_length=20, alphabet="abcdefghijklmnopqrstuvwxy")

    def __str__(self):
        return str(self.hostel.name)

    class Meta:
        verbose_name_plural = "Hostel Gallery"  # Fixed typo: Hotel -> Hostel


class HostelFeature(models.Model):
    hostel = models.ForeignKey(Hostel, on_delete=models.CASCADE)  # Fixed typo: hotel -> hostel
    icon_type = models.CharField(max_length=100, null=True, choices=ICON_TYPE)
    icon = models.CharField(max_length=100, null=True)
    name = models.CharField(max_length=100, null=True)

    def __str__(self):
        return str(self.name)

    class Meta:
        verbose_name_plural = "Hostel Features"  # Fixed typo: Hotel -> Hostel


class HostelFaqs(models.Model):
    hostel = models.ForeignKey(Hostel, on_delete=models.CASCADE)  # Fixed typo: hotel -> hostel
    question = models.CharField(max_length=1000)
    answer = models.CharField(max_length=1000, null=True, blank=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return str(self.question)

    class Meta:
        verbose_name_plural = "Hostel Faqs"  # Fixed typo: Hotel -> Hostel


class RoomType(models.Model):
    hostel = models.ForeignKey(Hostel, on_delete=models.CASCADE)  # Fixed typo: hotel -> hostel
    type = models.CharField(max_length=10)
    price = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)  # Fixed typo: max_digit -> max_digits
    room_capacity = models.PositiveIntegerField(default=0)
    rtid = ShortUUIDField(unique=True, length=10, max_length=20, alphabet="abcdefghijklmnopqrstuvwxy")
    slug = models.SlugField(unique=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.type} - {self.hostel.name} - {self.price}"

    class Meta:
        verbose_name_plural = "Room Types"  # Fixed typo: Hotel Type -> Room Types


class Room(models.Model):
    hostel = models.ForeignKey(Hostel, on_delete=models.CASCADE)  # Fixed typo: hotel -> hostel
    room_type = models.ForeignKey(RoomType, on_delete=models.CASCADE)
    room_number = models.CharField(max_length=1000)  # Fixed typo: max_Length -> max_length
    is_available = models.BooleanField(default=True)
    rtid = ShortUUIDField(unique=True, length=10, max_length=20, alphabet="abcdefghijklmnopqrstuvwxy")
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.room_type.type} - {self.hostel.name}"

    class Meta:
        verbose_name_plural = "Rooms"


class Booking(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    payment_status = models.CharField(max_length=100, choices=PAYMENT_STATUS)  # Fixed typo: max_Length -> max_length
    full_name = models.CharField(max_length=1000)
    email = models.EmailField(max_length=1000)
    phone = models.CharField(max_length=1000)

    hostel = models.ForeignKey(Hostel, on_delete=models.SET_NULL, null=True, blank=True)
    room_type = models.ForeignKey(RoomType, on_delete=models.SET_NULL, null=True, blank=True)
    room = models.ManyToManyField(Room)
    before_discount = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)  # Fixed typo: max_Length -> max_digits
    total = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)  # Fixed typo: max_Length -> max_digits
    saved = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)  # Fixed typo: max_Length -> max_digits

    check_in_date = models.DateField()
    check_out_date = models.DateField()

    total_days = models.PositiveIntegerField(default=0)

    checked_in = models.BooleanField(default=False)
    checked_out = models.BooleanField(default=False)

    is_active = models.BooleanField(default=False)

    checked_in_tracker = models.BooleanField(default=False)
    checked_out_tracker = models.BooleanField(default=False)
    date = models.DateTimeField(auto_now_add=True)
    stripe_payment_intent = models.CharField(max_length=1000, null=True, blank=True)
    success_id = models.CharField(max_length=1000, null=True, blank=True)  # Fixed typo: sucess_id -> success_id
    booking_id = ShortUUIDField(unique=True, length=10, max_length=30, alphabet="abcdefghijklmnopqrstuvwxyz")

    def __str__(self):
        return f"{self.booking_id}"

    def rooms(self):
        return self.room.all().count()


class ActivityLog(models.Model):
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    guest_out = models.DateTimeField()  # Fixed typo: guess_out -> guest_out
    guest_in = models.DateTimeField()  # Fixed typo: guess_in -> guest_in
    description = models.TextField(null=True, blank=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.booking}"


class StaffOnDuty(models.Model):  # Fixed typo: staffOnDuty -> StaffOnDuty (Class name should be in PascalCase)
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE)
    staff_id = models.CharField(max_length=100, null=True, blank=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.staff_id}"
