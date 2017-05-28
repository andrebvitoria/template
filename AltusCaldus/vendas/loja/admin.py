from django.contrib import admin
from .models import *

# Register your models here.




admin.site.register(Cor)
admin.site.register(Cliente)
admin.site.register(Prancha)
admin.site.register(TipoPrancha)
admin.site.register(Categoria)


@admin.register(Cantina)
class CantinaAdmin(admin.ModelAdmin):
    list_display = ('nome','descricao','preco','categoria',)
    date_hierarchy = 'created'
    list_filter = ('categoria',)
    search_fields = ('nome',)  


@admin.register(Camisa)
class CamisaAdmin(admin.ModelAdmin):
    list_display = ('nome', 'qtd','cor','tamanho',)
    date_hierarchy = 'created'
    list_filter = ('cor','tamanho','descricao')



@admin.register(Produto)
class ProdutoAdmin(admin.ModelAdmin):
    list_display = ('nome','qtd','preco','categoria',)
    date_hierarchy = 'created'
    list_filter = ('categoria',)
    search_fields = ('nome',)  



class DetalheVendaInline(admin.TabularInline):
    list_display = ('produto', 'quantidade','subtotal')
    exclude = ('preco',)
    readonly_fields = ['subtotal']
    model = DetalheVenda
    extra = 0


@admin.register(Venda)    
class VendaAdmin(admin.ModelAdmin):
    list_display = ('cliente', 'vendedor',)
    readonly_fields = ['_total']
    exclude = ('desconto','total',)
    search_fields = ('cliente',)
    date_hierarchy = 'created'
    list_filter = ('data',)
    inlines = [DetalheVendaInline]

