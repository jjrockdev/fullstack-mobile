import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/components/format_number.dart';
import 'package:restaurant_app/models/product_model.dart';
import 'package:restaurant_app/provider/product_provider.dart';
import 'package:restaurant_app/services/product_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ProductModel> productData = [];
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getProduct();
  }

  getProduct() async {
    setState(() {
      loading = true;
    });
    var _productData = await ProductService().getProduct();
    productData = _productData;
    setState(() {
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 65, 65),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: 50,
            //color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //child: SvgPicture.asset("assets/icons/apps.svg"),
              child: Icon(Icons.menu),
            ),
          ),
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Icon(Icons.shopping_cart),
            //color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Image.asset("assets/icons/profile.png"),
            ),
          )
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context,value,child) {
          return SingleChildScrollView(
            // SingleChildScrollView ແມ່ນເຮັດໜ້າທີ່ໃນການເລື່ອນລົງ ແລະ ຂື້ນ
            child: Column(
              /* crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center, */
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Text("data"),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        child: Container(
                          width: 380,
                          height: 50,
                          margin: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Search...",
                                suffixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      /* Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.tune, color: Colors.white, size: 25)),
                      ), */
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sport Shoes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                //ເຮັດໜ້າທີໃນການໂຫລດຂໍ້ມູນມາຕາມຈຳນວນທີ່ເຮົາຕ້ອງກັນໃຫ້ສະແດງ
                loading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: productData.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          //Begin row height and colomn
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          childAspectRatio: 0.6,
                          //End ແຖວທີ່ເຮັດໃຫ້ແຕ່ລະບ Box ສູງ ຫຼື ສັ້ນ
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  productData[index].image.toString(),
                                  //fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "Man Shoes",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "${FormatNumber.numberFormat(productData[index].price)} ກິບ",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ],
            ),
          );
        }
      ),
    );
  }
}
