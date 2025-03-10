import flet as ft

def main(page: ft.Page):
    page.title = "Shopping List" 
    lista = []
    
    def agregar_item(e):
        if agregar.value.strip():
            lista.append(agregar.value)
            actualizar()
            agregar.value = ""
        else:
            page.snack_bar = ft.SnackBar(ft.Text("item cannot be empty"))
            page.snack_bar.open = True
        page.update()

    def quitar_item(e):
        if lista:
            lista.pop()
            actualizar()
        else:
            page.snack_bar = ft.SnackBar(ft.Text("There are no items to remove"))
            page.snack_bar.open = True
        page.update()

    def limpiar(e):
        if lista:
            lista.clear()
            actualizar()
        else:
            page.snack_bar = ft.SnackBar(ft.Text("There are no items to clear"))
            page.snack_bar.open = True
        page.update()

    def actualizar():
        items.controls.clear()
        for index, item in enumerate(lista, start=1):
            items.controls.append(ft.Text(f"{index}. {item}"))
        page.update()

    agregar = ft.TextField(label="Item Name:", width=500)
    botonagregar = ft.FilledButton(text="Add Item", width=200, on_click=agregar_item)
    botonremove = ft.FilledButton(text="Remove Last Item", width=200, on_click=quitar_item)
    botonclear = ft.FilledButton(text="Clear All Items", width=200, on_click=limpiar)
    items = ft.Column(scroll="auto")

    page.add(agregar, botonagregar, botonremove, botonclear, items)

ft.app(target=main)

#profe yo use ai para ayudarme, aparte yo no estube aqui en esas clases.
