from django.urls import path
from MyApp import views
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    path("", views.home, name="home"),
    path("index.html", views.index, name="index"),
    path("procurar.html", views.procurar, name="procurar"),
    path("estudos.html", views.estudos, name="estudos"),
    path("detalhe_desaparecimento.html/<int:id>", views.detalhe_desaparecimento, name="detalhe_desaparecimento"),
]

urlpatterns += staticfiles_urlpatterns()

# []