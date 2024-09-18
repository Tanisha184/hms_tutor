from django.db import models
from django.utils.text import slugify
from django.utils.html import mark_safe
import shortuuid
from userauths.models import User
from shortuuid.django_fields import ShortUUIDField


HOSTEL_STATUS = (
    ("draft", "draft"),
    ("disabled", "disabled"),
    ("rejected", "rejected"),
    ("In review", "In review"),
    ("Live", "Live"),
)

class Hostel(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    name = models.CharField(max_length=100)  # Fixed typo: max_Length -> max_length
    description = models.TextField(null=True, blank=True)
    image = models.FileField(upload_to="hostel_gallery")  # Fixed typo: upLoad_to -> upload_to
    address = models.CharField(max_length=200)  # Fixed typo: max_Length -> max_length
    mobile = models.CharField(max_length=200)  # Fixed typo: max_Length -> max_length
    email = models.EmailField(max_length=100)  # Fixed typo: max_Length -> max_length
    status = models.CharField(max_length=20, choices=HOSTEL_STATUS, default='Live')  # Fixed typo: max_Length -> max_length

    tags = models.CharField(max_length=200, help_text="separate tags with commas")  # Fixed typo: max_Length -> max_length
    views = models.IntegerField(default=0)
    featured = models.BooleanField(default=False)
    hid = ShortUUIDField(unique=True, length=10, max_length=20, alphabet="abcdefghijklmnopqrstuvwxy")  # Fixed typo: alphabets -> alphabet, Length -> length
    slug = models.SlugField(unique=True)
    date = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
    
    def save(self, *args, **kwargs):
        if not self.slug:  # More concise check for empty slug
            uuid_key = shortuuid.uuid()
            uniqueid = uuid_key[:4]
            self.slug = slugify(self.name) + '-' + uniqueid.lower()
        super(Hostel, self).save(*args, **kwargs)

    def thumbnail(self):
        return mark_safe("<img src='%s' width='50' style='object-fit: cover; border-radius:6px;'/>" % (self.image.url))  # Fixed typo: wisth -> width, objects-fit -> object-fit
