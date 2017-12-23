from django.conf.urls import url
from . import views 

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^search/$', views.get_avail_trains, name='search'),
    url(r'^make-reservations/$', views.make_reservation, name="reserve"),
    url(r'^book_ticket/$', views.book_ticket, name="book")
]