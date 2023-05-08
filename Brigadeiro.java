
public class Brigadeiro extends MenuSobremesa
{

    public Brigadeiro()
    {

    }
    
    public String getName(){
       return "Brigadeiro";
   }
    
   public String getDescription(){
       return "Brigadeiro de chocolate";
   }
    
   public double getPrice(){
       return 1.50;
   }
        
   public String toString(){
       return "#  "+getName()+(isVegetarian()?"(v)":"")+", "+getPrice()+"     --  "+getDescription();
   }
   
   public void print(){
        System.out.print("Nome"+getName());
        if(isVegetarian()){
            System.out.print("(v)");
        }
        
        System.out.print("Pre�o unitario: "+getPrice());
        System.out.print(" Descri�ao:"+getDescription());
    }
}
