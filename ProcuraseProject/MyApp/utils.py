from datetime import date 

def get_idade(ano_nascimento):
    today = date.today()
    idade = today.year - ano_nascimento
    return idade
