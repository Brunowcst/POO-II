public class Cerveja extends MenuComponent
{
    public Cerveja(){        
    }
    
    public String getName(){
        return "Cerveja";
    }
    
    public String getDescription(){
        return "Cerveja Heineken";
    }
    
    public double getPrice(){
        return 15;
    }
        
    public String toString(){
        return "#  "+getName()+(isVegetarian()?"(v)":"")+", "+getPrice()+"     --  "+getDescription();
    }
    
    public void print(){
        System.out.print("Produto:"+getName());
        if(isVegetarian()){
            System.out.print("(v)");
        }
        
        System.out.print("Preço:"+getPrice());
        System.out.print(" Descriçao:"+getDescription());
    }

}
