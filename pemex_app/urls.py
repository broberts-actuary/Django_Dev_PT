from django.conf.urls import url
from pemex_app import views

urlpatterns = [
        url(r'^upload/$', views.upload, name='upload'),
        url(r'^assign/$', views.assign, name='assign'),
        url(r'^inputs/$', views.inputs, name='inputs'),
        url(r'^update/(?P<pk>\d+)/$', views.compliance_update, name='compliance_update'),
        ]
