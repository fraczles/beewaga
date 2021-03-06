from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.http import Http404
from django.core.exceptions import ObjectDoesNotExist

from accounts.models import UserProfile, RegularUser, Tutor, Pledge
from accounts.forms import UserCreateForm, AuthenticateForm, TutorCreateForm

import stripe

def home(request, user_form=None, auth_form=None):
    # If user is logged in, show different stuff.
    if request.user.is_authenticated():
        user = request.user
        count = len(request.user.profile.supports.all())
        tutors = request.user.profile.supports.all()
        return render(request,
                      'buddies.html',
                      {'tutors': tutors, 'count': count, 'supporters': None, 'next_url': '/', 'username': user.username})
    # Else show blank page
    else:
        user_form = UserCreateForm()
        auth_form = AuthenticateForm()
        return render(request,
                      'home.html',
                      {'user_form': user_form, 'auth_form': auth_form})


# Go to '/login' when 'Log in' button pressed.
def login_page(request):
    form = AuthenticateForm
    return render(request,
                  'login.html',
                  {'auth_form': form})

# Validate user's credentials upon logging in, redirect to home page.
def login_view(request):
    if request.method == 'POST':
        form = AuthenticateForm(data=request.POST)
        if form.is_valid():
            login(request, form.get_user())
            # Success!
            return redirect('/')
        else:
            # Failure!
            return redirect('/login')
    return redirect('/login')


def register_view(request):
    form = UserCreateForm()
    return render(request,
                  'register.html',
                  {'user_form': form})

# TODO: Define a view for collecting "users" or "userprofiles"(1 in the same?)

def tutors(request, username=""):
    #Called with a parameter in URL
    if username:
        try:
            tutor = Tutor.objects.get(username=username)
            count = len(tutor.profile.supported_by.all())
            revenue = 5
        except User.DoesNotExist:
            raise Http404
        # or request.user.profile.supports.filter(user.username==username)
        if username == request.user.username:
            # Return self profile
            return render(request, 'buddies.html', {'user': tutor })
        return render(request, 'tutor_profile.html', {'revenue': revenue,'tutor': tutor, 'count': count, 'follow': True, })
    tutors = Tutor.objects.all()
    revenue = 5
    l = []
    return render(request, 'profiles.html', {'revenue': revenue,'tutors': tutors, 'username': username, })

def logout_view(request):
    logout(request)
    return redirect('/')

def tutor_signup_view(request):
    tutor_form = TutorCreateForm()
    return render(request, 'tutor-register.html', {'tutor_form':tutor_form})

def tutor_signup(request):
    tutor_form = TutorCreateForm(data=request.POST)
    if request.method == 'POST':
        if tutor_form.is_valid():
            tutor = Tutor(username=request.user.username+"tutor", email=request.user.email+"tutor")
            tutor.save()
            return redirect('/')
        else:
            return redirect('/tutor-signup')
    return tutor_signup_view(request)

def signup(request):
    user_form = UserCreateForm(data=request.POST)
    if request.method == 'POST':
        if user_form.is_valid():
            username = user_form.clean_username()
            password = user_form.clean_password2()
            user_form.save()
            #user = authenticate(username=username, password=password)
            # Want more sophisticated email verification here.
            #login(request, user)
            return redirect('/')
        else:
            return redirect('/signup')
    return register_view(request)


@login_required
def supports(request):
    if request.method =='POST':
        support_id = request.POST.get('support', False)
        if support_id:
            try:
                tutor = Tutor.objects.get(id=support_id)
                user = request.user
                user.profile.supports.add(tutor.profile)
            except ObjectDoesNotExist:
                return redirect('/')
    return redirect('/pay/')

def about_beewaga(request):
    return render(request, 'about_beewaga.html')

def about_team(request):
    return render(request, 'about_team.html')

def about_name(request):
    return render(request, 'about_name.html')

def test(request):
    return render(request, 'sp3.html')


@login_required
def pay(request):
    if request.method == 'POST':
        support_id = request.POST.get('support', False)
        if support_id:
            try:
                tutor = Tutor.objects.get(id=support_id)
            except ObjectDoesNotExist:
                redirect('/')
        stripe.api_key = 'sk_test_kPXdUZ1fURSK3ziMEkw1O9rs'

        #Charge via stripe
        customer = stripe.Customer.create(
            description=request.user.username,
            card=request.POST.get('stripeToken')
        )
        user = request.user
        user.stripe_id = customer.id
        user.save()
        stripe.Charge.create(
            amount=500,
            currency="usd",
            customer=user.stripe_id,
            description="nice"
        )

        #Add supporter
        
        
        user.profile.supports.add(tutor.profile)
            

    return render(request, 'thank_you.html')

def thank_you(request):
    return render(request, 'thank_you.html')