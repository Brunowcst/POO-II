
public class Trufa extends MenuSobremesa
{

    public Trufa()
    {

    }
    
    public String getName(){
       return "Trufa";
   }
    
   public String getDescription(){
       return "Trufa com recheio";
   }
    
   public double getPrice(){
       return 2.50;
   }
        
   public String toString(){
       return "#  "+getName()+(isVegetarian()?"(v)":"")+", "+getPrice()+"     --  "+getDescription();
   }
   
   public void print(){
        System.out.print("Nome"+getName());
        if(isVegetarian()){
            System.out.print("(v)");
        }
        
        System.out.print("Preço unitario: "+getPrice());
        System.out.print(" Descriçao:"+getDescription());
    }
}
