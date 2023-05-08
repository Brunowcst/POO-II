public class TesteComposite {

    public MenuComponent montar(){
        MenuComponent menu1 = new MenuBarRestaurante();
        MenuComponent menu2 = new BarTorrao();
        MenuComponent menu3 = new RestauranteLuzia();
        
        MenuComponent item1 = new Cachaca();
        MenuComponent item2 = new PiraoDeQueijo();
        MenuComponent item3 = new Galinha();
        MenuComponent item4 = new Linguica();
        MenuComponent item5 = new Cerveja();
        MenuComponent item6 = new Brigadeiro();
        MenuComponent item7 = new Trufa();
        
        menu1.add(menu2);
        menu1.add(menu3);
        menu2.add(item1);
        menu2.add(item2);
        menu3.add(item3);
        menu3.add(item4);
        menu3.add(item5);
        menu3.add(item6);
        menu3.add(item7);
        
        return menu1;
        
        
    }

}
