from django.contrib import admin

from hostel.models import Hostel, Booking, ActivityLog, StaffOnDuty, Room, RoomType


class HostelAdmin(admin.ModelAdmin):
    list_display = ['thumbnail','name','user','status']
    prepopulated_fields =  {"slug": ("name",)}

admin.site.register(Hostel, HostelAdmin)
admin.site.register(Booking)
admin.site.register(ActivityLog)
admin.site.register(StaffOnDuty)
admin.site.register(Room)
admin.site.register(RoomType)

