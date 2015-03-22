public class juego{
    public static void main(String[]args){
	System.out.println("Hola!, Tratare de adivinar un numero");


	try{
	    Thread.sleep(5000);
	}

	catch(InterruptedException ex){
	    Thread.currentThread().interrupt();
	}

	System.out.println("Multiplicalo por 9");

	try{
	    Thread.sleep(5000);
	}

	catch(InterruptedException ex){
	    Thread.currentThread().interrupt();
	}

	System.out.println("Si el numero es de dos digitos, sumalos entre si.");

	try{
	    Thread.sleep(5000);
	}

	catch(InterruptedException ex){
	    Thread.currentThread().interrupt();
	}

	System.out.println("Al numero resultante sumale 4 ");
	try{
	    Thread.sleep(10000);
	}

	catch(InterruptedException ex){
	    Thread.currentThread().interrupt();
	}
	
	System.out.println("Muy bien. El resultado es 13 :)");
    }
}
