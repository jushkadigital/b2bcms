from django.conf import settings
from django.db import models
from django.shortcuts import get_object_or_404
from rest_framework.filters import BaseFilterBackend
from taggit.managers import TaggableManager

from wagtail.models import Locale, Page
from wagtail.search.backends import get_search_backend
from wagtail.search.backends.base import FilterFieldError, OrderByFieldError

from wagtail.api.v2.utils import BadRequestError, parse_boolean

class AlgoRecomendationsFilterTour(BaseFilterBackend):
    """
    Implements the ?sss filter which apply a custom recomendation Algorithmin .
    """

    def filter_queryset(self, request, queryset, view):
        if "sss" in request.GET:
            try:
                senderToAvoid = int(request.GET["sender"])
            except:
                raise BadRequestError("sender cant be a Null or String must be a number") 
            algoParameter = request.GET["sss"]
            if algoParameter == "basic":
                return queryset.exclude(pk=senderToAvoid).order_by("?")[:4]
        return queryset


class AlgoRecomendationsFilterPaquete(BaseFilterBackend):
    """
    Implements the ?sss filter which apply a custom recomendation Algorithmin .
    """

    def filter_queryset(self, request, queryset, view):
        if "sss" in request.GET:
            try:
                senderToAvoid = int(request.GET["sender"])
            except:
                raise BadRequestError("sender cant be a Null or String must be a number") 
            algoParameter = request.GET["sss"]
            print("queryModel")
            print(queryset.model)
            if algoParameter == "basic":
                return queryset.exclude(pk=senderToAvoid).order_by("?")[:1]
            elif algoParameter == "campaing":
                return queryset.filter(**{"isCampaing":True})
            elif algoParameter == "nocampaing":
                return queryset.filter(**{"isCampaing":False})
        return queryset

class FilterBlogPage(BaseFilterBackend):
    """
    Implements the ?sss filter which apply a simples filters .
    """

    def filter_queryset(self, request, queryset, view):
        if "sss" in request.GET:
            try:
                senderToAvoidList = (request.GET["sender"].split(","))
            except:
                raise BadRequestError("sender cant be a Null or String must be a number") 
            filterParameter = request.GET["sss"]
            print("queryModel")
            print(queryset.model)
            if filterParameter == "articulosRec":
                return queryset.exclude(pk__in=senderToAvoidList)
        return queryset
