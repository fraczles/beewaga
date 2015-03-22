from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',
                       # Examples:

                       url(r'^$', 'beewaga_app.views.home', name='home'),
                       url(r'^admin/', include(admin.site.urls)),
                       url(r'^signup$', 'beewaga_app.views.signup',
                           name='home'),
                       url(r'^logout$', 'beewaga_app.views.logout_view',
                           name='logout'),
                       url(r'^login$', 'beewaga_app.views.login_page',
                           name='login'),
                       url(r'^login-check$',
                           'beewaga_app.views.login_view', name='login_view'),
                       url(r'^register$',
                           'beewaga_app.views.register_view', name='register'),
                       url(r'^tutors/$', 'beewaga_app.views.tutors'),
                       url(r'^tutor-signup/$', 'beewaga_app.views.tutor_signup_view'),
                       url(r'^tutor-signup-view/$', 'beewaga_app.views.tutor_signup'),
                       url(r'^tutors/(?P<username>\w{0,30})/$',
                           'beewaga_app.views.tutors'),
                       url(r'^support/$', 'beewaga_app.views.supports'),
                       url(r'^about_team/$', 'beewaga_app.views.about_team', name='about_team'),
                       url(r'^about_beewaga/$', 'beewaga_app.views.about_beewaga', name='about_beewaga'),
                       url(r'^TEST/$', 'beewaga_app.views.test', name='test'),
                       url(r'^pay/$', 'beewaga_app.views.pay', name='test'),
                       )

