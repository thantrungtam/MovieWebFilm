from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Actor

# Create your views here.

class ActorListView(ListView):
    model = Actor
    template_name = 'actor/actor_list.html'
    context_object_name = 'actors'

class ActorDetailView(DetailView):
    model = Actor
    template_name = 'actor/actor_detail.html'
    context_object_name = 'actor'
