from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User, AbstractBaseUser, PermissionsMixin, BaseUserManager
import hashlib


class RegularUserManager(BaseUserManager):

    def _create_user(self, email, password,
                     is_staff, is_superuser, **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        now = timezone.now()
        if not email:
            raise ValueError('The given email must be set')
        email = self.normalize_email(email)
        user = self.model(email=email,
                          is_staff=is_staff, is_active=True,
                          is_superuser=is_superuser, last_login=now,
                          date_joined=now, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        return self._create_user(email, password, False, False,
                                 **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        return self._create_user(email, password, True, True,
                                 **extra_fields)


class RegularUser(AbstractBaseUser, PermissionsMixin):
    # Redefine regular user fields
    username = models.CharField(unique=True, max_length=20)
    email = models.EmailField(
        verbose_name='email address', unique=True, max_length=255)
    first_name = models.CharField(max_length=30, null=True, blank=True)
    last_name = models.CharField(max_length=50, null=True, blank=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True, null=False)
    is_staff = models.BooleanField(default=False, null=False)


    objects = RegularUserManager()
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    stripe_id = models.CharField(max_length=50, null=True)
    # New stuff
    user_image = models.ImageField(
        upload_to="uploads", blank=False, null=False, default="/static/gfx/logo.png")
    user_bio = models.CharField(max_length=600, blank=True)

    def get_full_name(self):
        fullname = self.first_name + " " + self.last_name
        return fullname

    def get_short_name(self):
        return self.username

    def __unicode__(self):
        return self.email


class Tutor(RegularUser):
    tutor_image = models.ImageField(
        upload_to="uploads", blank=False, null=True, default="/static/gfx/logo.png")
    tutor_bio = models.CharField(max_length=600, blank=True, null=True)

class TutorProfile(models.Model):
    tutor = models.OneToOneField(Tutor)
    subjects = models.CharField(max_length=100, null=True)
    def gravatar_url_tutor(self):
        return "http://www.gravatar.com/avatar/%s?s=50" % hashlib.md5(self.tutor.email).hexdigest() 

class UserProfile(models.Model):
    user = models.OneToOneField(RegularUser)
    #pledge = models.DecimalField(null=True,max_digits=99999, decimal_places=2)
    supports = models.ManyToManyField(TutorProfile, related_name='supported_by', symmetrical=False)

    def gravatar_url(self):
        return "http://www.gravatar.com/avatar/%s?s=50" % hashlib.md5(self.user.email).hexdigest() 

    



RegularUser.profile = property(lambda u: UserProfile.objects.get_or_create(user=u)[0])
Tutor.profile = property(lambda u: TutorProfile.objects.get_or_create(tutor=u)[0])
