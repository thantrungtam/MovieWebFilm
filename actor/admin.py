from django.contrib import admin
from django import forms
from .models import Actor
from movies.models import Movie

class MovieInline(admin.TabularInline):
    model = Movie.actors.through
    verbose_name = "Phim"
    verbose_name_plural = "Danh sách phim"
    extra = 1
    autocomplete_fields = ['movie']

class ActorAdminForm(forms.ModelForm):
    class Meta:
        model = Actor
        fields = '__all__'
        widgets = {
            'biography': forms.Textarea(attrs={'rows': 5}),
            'introduction': forms.Textarea(attrs={'rows': 3}),
        }

@admin.register(Actor)
class ActorAdmin(admin.ModelAdmin):
    form = ActorAdminForm
    list_display = ('name', 'alternate_name', 'gender', 'birthdate', 'get_age', 'get_movie_count')
    list_filter = ('gender',)
    search_fields = ('name', 'alternate_name', 'introduction', 'biography')
    autocomplete_fields = []
    readonly_fields = ('get_age', 'get_movie_count')
    date_hierarchy = 'birthdate'
    inlines = [MovieInline]
    
    fieldsets = (
        ('Thông tin cơ bản', {
            'fields': ('name', 'alternate_name', 'gender', 'birthdate', 'get_age'),
        }),
        ('Giới thiệu', {
            'fields': ('introduction', 'biography'),
            'classes': ('collapse',),
        }),
        ('Hình ảnh', {
            'fields': ('image',),
        }),
        ('Thống kê', {
            'fields': ('get_movie_count',),
        }),
    )
    
    # Customize the change list view
    def get_changelist(self, request, **kwargs):
        from django.contrib.admin.views.main import ChangeList
        class ActorChangeList(ChangeList):
            def get_results(self, *args, **kwargs):
                super().get_results(*args, **kwargs)
                # Prefetch related movies to optimize queries
                self.result_list = self.result_list.prefetch_related('movies')
        return ActorChangeList
    
    # Add custom help text
    def get_form(self, request, obj=None, **kwargs):
        form = super().get_form(request, obj, **kwargs)
        form.base_fields['introduction'].help_text = "Giới thiệu ngắn gọn về diễn viên"
        form.base_fields['biography'].help_text = "Thông tin chi tiết về sự nghiệp của diễn viên"
        return form
    