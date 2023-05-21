public class RedDuck extends Duck
{
    RedDuck(){
        setFlyBehavior(new FlyWithWings());
        setQuackBehavior(new NaturalQuack());
        setSwinBehavior(new SwimFast());
    }
    
    public void display(){
        System.out.println("Red duck");
    }
}