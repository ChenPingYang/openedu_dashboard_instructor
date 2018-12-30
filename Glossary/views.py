from django.shortcuts import render


# Create your views here.
def glossary_view(request):
    request.encoding = 'utf-8'
    to_render = {}

    return render(request, 'glossary.html', to_render)
