from django.db import models

class Provincia(models.Model):
    nome = models.CharField(max_length=200)


class Municipio(models.Model):
    provincia = models.ForeignKey(Provincia, on_delete=models.CASCADE)
    nome = models.CharField(max_length=200)
    

class Comuna(models.Model):
    municipio = models.ForeignKey(Municipio, on_delete=models.CASCADE)
    nome = models.CharField(max_length=200)


class Bairro(models.Model):
    comuna = models.ForeignKey(Comuna, on_delete=models.CASCADE)
    nome = models.CharField(max_length=200)


class Morada(models.Model):
    bairro = models.ForeignKey(Bairro, on_delete=models.CASCADE)
    rua = models.CharField(max_length=200)
    numero_casa = models.IntegerField(default=0)


class Pessoa(models.Model):
    morada = models.ForeignKey(Morada, on_delete=models.CASCADE)
    nome = models.CharField(max_length=200)
    data_nascimento = models.DateField()
    sexo = models.CharField(max_length=200)


class Estado(models.Model):
    descricao = models.CharField(max_length=200)


class Deficiencia(models.Model):
    nome = models.CharField(max_length=200)


class MotivoDesaparecimento(models.Model):
    descricao = models.CharField(max_length=200)


class Desaparecimento(models.Model):
    pessoa = models.ForeignKey(Pessoa, on_delete=models.CASCADE)
    estado = models.ForeignKey(Estado, on_delete=models.CASCADE)
    deficiencia = models.ForeignKey(Deficiencia, on_delete=models.CASCADE)
    motivo_desaparecimento = models.ForeignKey(MotivoDesaparecimento, on_delete=models.CASCADE)
    data_desaparecimento = models.DateField()
    foto = models.CharField(max_length=200)
    observacao = models.CharField(max_length=200)


class GrauParentesco(models.Model):
    descricao = models.CharField(max_length=200)


class ContatoDesaparecimento(models.Model):
    desaparecimento = models.ForeignKey(Desaparecimento, on_delete=models.CASCADE)
    grau_parentesco = models.ForeignKey(GrauParentesco, on_delete=models.CASCADE)
    nome_parente = models.CharField(max_length=200)
    numero_telefone_1 = models.IntegerField()
    numero_telefone_2 = models.IntegerField()
