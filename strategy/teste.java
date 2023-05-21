public class teste{
    public static void main(String[] args)
    {
        
    }
    
    public void teste(){
        RedDuck patoVermelho = new RedDuck();
        System.out.println("Testando");
        patoVermelho.performQuack();
        patoVermelho.performFly();
        patoVermelho.performSwim();
        System.out.println("Mudando o comportamento de quack");
        patoVermelho.setQuackBehavior(new MuteQuack());
        patoVermelho.performQuack();
        System.out.println("Mudando o quack para o quack natual");
        patoVermelho.setQuackBehavior(new NaturalQuack());
        patoVermelho.performQuack();
    }
}
