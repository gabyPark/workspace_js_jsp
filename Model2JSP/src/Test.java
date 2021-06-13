import java.awt.Frame;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

interface aa{
	public void testa();
}

class tesa implements aa{
	@Override
	public void testa() {
		System.out.println("aaa");
	}
}

class testf extends Frame {
	
	public testf() {
		addWindowListener(new WindowListener() {
			
			@Override
			public void windowOpened(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowIconified(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowDeiconified(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowDeactivated(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowClosing(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowClosed(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowActivated(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
		});		
	}
	
}


public class Test {

	
	public static void main(String[] args) {
		tesa a = new tesa();
		a.testa();
		
		aa a1 = new aa() {
			@Override
			public void testa() {
				// TODO Auto-generated method stub
				
			}
		};
		
		a1.testa();
		

	}

}
