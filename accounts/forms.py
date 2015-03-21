from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth.admin import UserAdmin as AuthUserAdmin
from django.contrib import admin
from django.db import models
from django.contrib.auth.models import User
from django import forms
from django.utils.html import strip_tags
from django.contrib.auth import get_user_model
from accounts.models import RegularUser, RegularUserManager, Tutor
# Create your models here.









class UserCreateForm(UserCreationForm):
    email = forms.EmailField(required=True, widget=forms.widgets.TextInput(
        attrs={'placeholder': 'Email', 'class': 'registerInput'}))
    first_name = forms.CharField(required=True, widget=forms.widgets.TextInput(
        attrs={'placeholder': 'First Name', 'class': 'registerInput'}))
    last_name = forms.CharField(required=True, widget=forms.widgets.TextInput(
        attrs={'placeholder': 'Last Name', 'class': 'registerInput'}))
    username = forms.CharField(widget=forms.widgets.TextInput(
        attrs={'placeholder': 'Username', 'class': 'registerInput'}))
    password1 = forms.CharField(widget=forms.widgets.PasswordInput(
        attrs={'placeholder': 'Password', 'class': 'registerInput'}))
    password2 = forms.CharField(widget=forms.widgets.PasswordInput(
        attrs={'placeholder': 'Password Confirmation', 'class': 'registerInput'}))

    def is_valid(self):
        form = super(UserCreateForm, self).is_valid()
        for f, error in self.errors.iteritems():
            if f != '__all_':
                self.fields[f].widget.attrs.update(
                    #Appends "error class" to invalid forms( if form.is_valid() fails )
                    {'class': 'error', 'value': strip_tags(error)})
        return form

    def clean_username(self):
        # Since User.username is unique, this check is redundant,
        # but it sets a nicer error message than the ORM. See #13147.
        username = self.cleaned_data["username"]
        try:
            self._meta.model._default_manager.get(username=username)
        except self._meta.model.DoesNotExist:
            return username
        raise forms.ValidationError(self.error_messages['duplicate_username'])

    class Meta:
        fields = ['email', 'username', 'first_name',
                  'last_name', 'email', 'password1', 'password2']
        model = get_user_model()



class TutorCreateForm(forms.Form):
    subjects = forms.CharField(max_length=100)
    bio = forms.CharField(widget=forms.widgets.TextInput(
        attrs={'placeholder': 'Subjects', 'class': 'tutorRegisterInput'}))

    class Meta:
        fields = ['subjects', 'bio']
        model = Tutor


class AuthenticateForm(AuthenticationForm):
    username = forms.CharField(widget=forms.widgets.TextInput(
        attrs={'placeholder': 'Email', 'class': 'authInput'}))
    password = forms.CharField(widget=forms.widgets.PasswordInput(
        attrs={'placeholder': 'Password', 'class': 'authInput'}))

    def is_valid(self):
        form = super(AuthenticateForm, self).is_valid()
        for f, error in self.errors.iteritems():
            if f != '__all__':
                self.fields[f].widget.attrs.update(
                    {'class': 'error', 'value': strip_tags(error)})
        return form


class UserAdmin(AuthUserAdmin):
    add_form = UserCreateForm


admin.site.register(User, UserAdmin)
