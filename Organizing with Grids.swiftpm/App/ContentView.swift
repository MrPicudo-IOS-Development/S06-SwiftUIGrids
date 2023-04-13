/* ContentView.swift --> Grids. Created by Miguel Torres on 13/04/2023 */

import SwiftUI

struct ContentView: View {
    
    // Objeto que define un arreglo de elementos "GridItem()", es decir, creamos una cuadrícula que tendrá 3 columnas.
    let columnLayout = Array(repeating: GridItem(), count: 3)

    // Variable mutable que define el color seleccionado para mostrarlo en el texto "Selected Color" de la app.
    @State private var selectedColor = Color.gray

    // Arreglo de colores para la App.
    let allColors: [Color] = [
        .pink,
        .red,
        .orange,
        .yellow,
        .green,
        .mint,
        .teal,
        .cyan,
        .blue,
        .indigo,
        .purple,
        .brown,
        .gray
    ]

    // Definimos la estructura y apariencia de la vista "ContentView()"
    var body: some View {
        // Todo el body del Content View está dentro de este VStack
        VStack {
            // Este es el texto que cambia de color porque su propiedad ".foregroundColor" depende de la variable de estado.
            Text("Selected Color")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(selectedColor)
                .padding(10)
            
            // Usamos un ScrollView para que en caso de que haya más colores de los que caben, podamos desplazarnos.
            ScrollView {
                // Iniciamos la cuadrícula que se crea con el arreglo de objetos GridItem que definimos arriba. El tipo de objeto "LayVGrid" crea cada cuadrícula o "grid" hasta que se necesita, y no antes. El argumento de LazyVGrid define cuántas columnas se van a mostrar en la cuadrícula.
                LazyVGrid(columns: columnLayout) {
                    // Por cada color en la lista de "allColors", vamos a crear un botón.
                    ForEach(allColors, id: \.description) { color in
                        Button {
                            // La acción que genera el botón es cambiar el color de la variable "selectedColor"
                            selectedColor = color
                        } label: {
                            RoundedRectangle(cornerRadius: 50.0)
                                .aspectRatio(1.0, contentMode: ContentMode.fit) // Relación de aspecto entre el ancho y el alto del botón (el ancho se define por el espacio disponible para los 3 botones)
                                .foregroundColor(color) // El color de fondo de todo el botón coincide con el color que modifica para el texto de arriba.
                        }
                        .buttonStyle(.plain) // Estilo del botón.
                    }
                }
            }
        }
        .padding(10) // Es el espacio alrededor de todo el Stack vertical, y los extremos de la pantalla.
    }
}
