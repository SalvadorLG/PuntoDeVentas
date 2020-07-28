package PuntoVentas.view;


import java.net.URL;
import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.ResourceBundle;

import PuntoVentas.model.ClassProductos;
import PuntoVentas.model.ConnectorMySQL;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
public class ControllerVENTASHISTORIAL {
	private int conta=0;
	private float sumaCosto;
	@FXML
	private Button Salir;
	@FXML
	private TextField CAJAidproduct;
	@FXML
    private TableColumn<ClassProductos, String> tipoProduct;
	@FXML
    private TableColumn<ClassProductos, String> idTipoProduct;
	@FXML
    private TableColumn<ClassProductos, String> nombreProduct;
	@FXML
    private TableColumn<ClassProductos, String> folio;
	@FXML
    private TableColumn<ClassProductos, String> precio;
	@FXML
    private TableColumn<ClassProductos, String> nombreProvee;
    @FXML
    private TableView<ClassProductos> tablaProduct;
    @FXML
    private TextField CAJAmontopagar;
    @FXML
    private TextField CAJAmontoentrada;
    @FXML
    private TextField CAJAmonto;
    @FXML
    private TextField CAJAmontoIVA;
    @FXML
    private TextField CAJAdarcambio;
    
    ObservableList<ClassProductos> productList = FXCollections.observableArrayList();
	
    @FXML
    public void initialize() {
    	tipoProduct.setCellValueFactory(new PropertyValueFactory<>("tipoProducto"));
		idTipoProduct.setCellValueFactory(new PropertyValueFactory<>("tipoProductoID"));
		nombreProduct.setCellValueFactory(new PropertyValueFactory<>("nomProducto"));
		folio.setCellValueFactory(new PropertyValueFactory<>("folioProducto"));
		precio.setCellValueFactory(new PropertyValueFactory<>("Precio"));
		nombreProvee.setCellValueFactory(new PropertyValueFactory<>("nombreproveedor"));
	    //tablaProducto.addListener(selectorTablaProductos);
    }
    
	@FXML	
	public void getProductList(){
		int resp ;
		Connection connection = ConnectorMySQL.getConnection();
		String query = "SELECT * FROM datosproduct WHERE folioproduct = "+ CAJAidproduct.getText();
		Statement st;
		ResultSet rs;
		float cambio=0;
		try {
			st = connection.createStatement();
			rs = st.executeQuery(query);
			ClassProductos Productos;
			while(rs.next()) {
				Productos = new ClassProductos(rs.getString("tipoProduct"),rs.getInt("CantidadProducto"),rs.getInt("IDtipoProduct"),rs.getString("nombre"),rs.getString("folioproduct"),rs.getFloat("precio"),rs.getString("nombreProveedor"));
				conta++;
				
				productList.add(Productos);	
			}
//			int e=rs.getInt("2");
//			resp= e-conta;
			
//			System.out.println("resp"+ resp);
			float preciosSinIVA = calcularPrecio();
			CAJAmonto.setText(String.valueOf(preciosSinIVA));
			float iva=(float) (preciosSinIVA*(0.16));
			CAJAmontoIVA.setText(String.valueOf(iva));
			float preciosTotal = iva+preciosSinIVA;
			CAJAmontopagar.setText(String.valueOf(preciosTotal));
			tablaProduct.getItems().setAll(productList);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@FXML
	private void cambio() {
		float entrada = Float.valueOf(CAJAmontoentrada.getText());
		float total = Float.valueOf(CAJAmontopagar.getText());
		
		float cambio = entrada-total;
		
		CAJAdarcambio.setText(String.valueOf(cambio));
	}
	
	private float calcularPrecio() {
		float preciosSinIVA = 0;
		for (ClassProductos classProductos : productList) {
			preciosSinIVA += classProductos.getPrecio();
		}
		return preciosSinIVA;
	}
	
    public void executeQuery(String query) {
		Connection conn = ConnectorMySQL.getConnection();
		Statement st;
		try {
			st = conn.createStatement();
			st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@FXML
	public void regresarLogin() {
		try {
			AnchorPane root2 = (AnchorPane)FXMLLoader.load(getClass().getResource("FXMLPuntoVentasLOGIN.fxml"));
			Scene scene = new Scene (root2);
			Stage primaryLayout = new Stage();
			primaryLayout.setScene(scene);
			primaryLayout.setTitle("FXMLPuntoVentasLOGIN");
			primaryLayout.show();
			Stage nuevaEscena =(Stage) this.Salir.getScene().getWindow();
			nuevaEscena.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@FXML
	private Button Regresar;
	@FXML
	public void cargarListado() {
		try {
			AnchorPane root2 = (AnchorPane)FXMLLoader.load(getClass().getResource("FXMLPuntoVentasLISTADO.fxml"));
			Scene scene = new Scene (root2);
			Stage primaryLayout = new Stage();
			primaryLayout.setScene(scene);
			primaryLayout.setTitle("FXMLPuntoVentasLISTADO");
			primaryLayout.show();
			Stage nuevaEscena =(Stage) this.Regresar.getScene().getWindow();
			nuevaEscena.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void archivoTXT() {
		for (int i = 0; i < productList.size(); i++) {
			
			
			try {
	            String ruta = "D://Eclipse H.W//PuntoDeVentas//TXTtickets.txt";
	            String contenido = "Contenido de ejemplo";
	            File file = new File(ruta);
	            // Si el archivo no existe es creado
	            if (!file.exists()) {
	                file.createNewFile();
	            }
	            FileWriter fw = new FileWriter(file);
	            BufferedWriter bw = new BufferedWriter(fw);
	            bw.write(contenido);
	            bw.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		}
	}
	
	
	private void generarTicket(int nRandom) throws FileNotFoundException, UnsupportedEncodingException {
		PrintWriter writer = new PrintWriter("TXTtickets/" + String.valueOf(nRandom) + ".txt", "UTF-8");
		for (ClassProductos classProductos : productList) {
			writer.println("Folio del ticket: " + nRandom);
			writer.println("-------------------------");
			writer.println("Tipo de Producto: " + classProductos.getTipoProducto());
			writer.println("Nombre: " + classProductos.getNomProducto());
			writer.println("Folio: " + classProductos.getFolioProducto());
			writer.println("Precio: $" + classProductos.getPrecio());
			writer.println("");
		}
		
		writer.println("-------------------------");
		writer.println("Subtotal: $" + 	CAJAmonto.getText());
		writer.println("IVA: $" + CAJAmontoIVA.getText());
		writer.println("Total: $" + CAJAmontopagar.getText());
		writer.println("Pago: $" + CAJAmontoentrada.getText());
		writer.println("Cambio: $" + CAJAdarcambio.getText());
		
		writer.close(); 
		cargarListado();
	}
	
	@FXML
	private void finalizarCompra() {
		Random r = new Random();
	    int nRandom = r.nextInt(999999999)+1;
	    try {
			generarTicket(nRandom);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
