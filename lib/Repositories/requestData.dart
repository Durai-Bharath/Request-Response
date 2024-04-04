class Requests{
    String body;
    bool isApproved;
   Requests(this.body,this.isApproved);

   static List<Requests> loadData (){
    List<Requests>  list = [];
    list.add(Requests("A", false));
    list.add(Requests("B", false));
    list.add(Requests("c", false));
    list.add(Requests("D", false));
    list.add(Requests("E", false));
    list.add(Requests("F", false));
    return list;
   }
    static List<Requests> list = [];
    static void add(Requests req){
      list.add(req);
    }
    static List<Requests> loadApprovedData(){
      return list;
    }
}