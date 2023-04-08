from django.shortcuts import render
from .models import Pessoa
from .models import Provincia
from .models import Municipio
from .models import Comuna
from .models import Bairro
from .models import Morada
from .models import GrauParentesco
from .models import Estado
from .models import Desaparecimento
from .models import Deficiencia
from .models import ContatoDesaparecimento
from .models import MotivoDesaparecimento

from .utils import get_idade



# Create your views here.

def index(request):
    context={}
    return render(request, 'index.html', context)

def home(request):
    context={}
    return render(request,'base.html', context)

def sobre(request):
    context={}
    return render(request,'sobre.html', context)

def procurar(request):
    mydata_desaparecimentos = Desaparecimento.objects.all().values()

    mydata_pessoa = Pessoa.objects.all().values()

    lista_idades = calcular_idade(mydata_pessoa)

    mydata_provincia = Provincia.objects.all().values()

    context = {
        'desaparecimentos': mydata_desaparecimentos,
        'pessoas': mydata_pessoa,
        'provincias': mydata_provincia,
        'lista_idades': lista_idades
    }
    return render(request,'procurar.html', context)


def calcular_idade(mydata_pessoa):
    lista_idades = []
    lista_pessoa = Pessoa.objects.all().values()
    print(lista_pessoa)
    i = 1
    #for i in Pessoa.objects.count:
        # lista_idades[i] = get_idade(lista_pessoa[i].data_nascimento.year)
    return lista_idades
    


def estudos(request):
    context={}
    return render(request,'estudos.html', context)


def detalhe_desaparecimento(request, id):
    
    mydata_desaparecimento = Desaparecimento.objects.get(id=id)

    mydata_pessoa = Pessoa.objects.get(id=mydata_desaparecimento.pessoa_id)

    idade = get_idade(mydata_pessoa.data_nascimento.year)

    mydata_motivo_desaparecimento = MotivoDesaparecimento.objects.get(id=mydata_desaparecimento.motivo_desaparecimento_id)
    #mydata_contato_desaparecimento = ContatoDesaparecimento.objects.get(desaparecimento=mydata_desaparecimento)
    context={
        'desaparecimento': mydata_desaparecimento,
        'pessoa': mydata_pessoa,
        'motivo_desaparecimento': mydata_motivo_desaparecimento,
        'idade': idade,
        #'contato_desaparecimento': mydata_contato_desaparecimento,
    }
    return render(request,'detalhe_desaparecimento.html', context)



