public abstract class Duck
{
    protected QuackBehavior quackBehavior;
    protected FlyBehavior flyBehavior;
    protected SwimBehavior swimBehavior;
    
    public abstract void display();
    
    public void performQuack(){
        quackBehavior.quack();
    }

    public void performFly(){
        flyBehavior.fly();
    }
    
    public void performSwim(){
        swimBehavior.swim();
    }

    public void setQuackBehavior(QuackBehavior quack){
        quackBehavior = quack;
    }

    public void setFlyBehavior(FlyBehavior fly){
        flyBehavior = fly;
    }

    public void setSwinBehavior(SwimBehavior swim){
        swimBehavior = swim;
    }
}