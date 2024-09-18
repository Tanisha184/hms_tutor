from django.contrib import admin

from hostel.models import Hostel


class HostelAdmin(admin.ModelAdmin):
    list_display = ['thumbnail','name','user','status']
    prepopulated_fields =  {"slug": ("name",)}

admin.site.register(Hostel, HostelAdmin)
