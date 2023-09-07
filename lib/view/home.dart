import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:size_config_fl/size_config_fl.dart';
import 'package:yellochat_interview/model/sample_data_model.dart';
import 'package:yellochat_interview/providers/data_provider.dart';
import 'package:yellochat_interview/utils/textfield_widget.dart';



class HomeScreen extends StatefulWidget {
  static const route = "homescreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 
  TextEditingController _editingController = TextEditingController();

 

  @override
  void initState() {
   init();
    super.initState();
  }
  void init()async{
    
    var _provider = Provider.of<DataProvider>(context,listen: false);
  await _provider.getData(context: context);
   _provider.select = Cleaners.one;
                           _provider.selectColora =  Colors.yellow.withOpacity(0.20);;
                           _provider.selectColorb = Colors.white;
                           _provider.selectColorc = Colors.white;
                           _provider.selectBordera = Colors.yellow;
                           _provider.selectBorderb = Colors.grey;
                           _provider.selectBorderc = Colors.grey;
                           _provider.one.clear();
                          if(_provider.dataModel != null){
                            _provider.one = _provider.dataModel!.data!.items!.first.items!.toList();
                            _provider.selectedIndex =  _provider.dataModel!.data!.items!.first.items!.indexWhere((element) => element.isPrefer == true); 
                            _provider.cleanerCount = 1;
                            _provider.cleanerHour = _provider.dataModel!.data!.items!.first.items!.where((element) => element.isPrefer == true).first.itemName.toString();   
                            _provider.total = _provider.dataModel!.data!.items!.first.items!.where((element) => element.isPrefer == true).first.unitPrice!.toDouble()/2.5;                           
 
                            
                                                    }
                            }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
          
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Maid Service",style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.bold,),),
            Row(
              children: [
                SizedBox(
                  width: 180* w,
                  child: Text("Dubai International Airport(DXB)-Dubai-unit",style: GoogleFonts.inter(fontSize: 12,color: Color.fromARGB(255, 153, 111, 4)),overflow: TextOverflow.ellipsis,)),
                  SizedBox(width: 5* w,),
                Text("Change Loaction",style: GoogleFonts.inter(fontSize: 12,color: Colors.blue,fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),

      ),
      body: SingleChildScrollView(
        child: Consumer<DataProvider>(
          builder: (context,provider,_) {
            var data = provider.dataModel?.data;
            if(provider.isLoading == true){
              return Center(child: CircularProgressIndicator(),);
            }
            if(data == null){
              return Center(child: const Text("No data found"),);
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                    data.title.toString(),style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10* h,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: data.items!.map((e) {
                      int index = data.items!.indexOf(e);
                     
                      return cleanersWidegte(provider: provider,index: index,e: e);
                    }).toList()
                     
                  ),
                   SizedBox(height: 10* h,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                    data.itemTitle.toString(),style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: provider.one.length,
                    padding: EdgeInsets.only(top: 10 * h),
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      
            
                      
                     
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                             
                              provider.selectedIndex = index;
                              provider.total =provider.one[index].isPrefer == true? (provider.one[index].unitPrice!/2.5): (provider.one[index].unitPrice!/double.parse(provider.one[index].itemName.toString().split(" ").first));
                            },
                            child: Container(
                          margin: EdgeInsets.only(right: 15* w),
                          height: 55 * h,
                          width: 145 * w ,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:index == provider.selectedIndex ? Colors.yellow.withOpacity(0.20) : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color:index == provider.selectedIndex ? Colors.yellow : Colors.grey,width: 2)
            
                          ),
                        
                          
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(provider.one[index].itemName.toString())
                              ],
                            ),
                          ),
                        ),
                          ),
            
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                   Text("AED ${(provider.one[index].unitPrice!/double.parse(provider.one[index].itemName.toString().split(" ").first) + 6).toStringAsFixed(2)} /hr ",style: GoogleFonts.inter(fontSize: 12* f,fontWeight: FontWeight.w400,color: Colors.grey,decoration: TextDecoration.lineThrough),),
                                  Text("AED ${(provider.one[index].isPrefer == true ?provider.one[index].unitPrice!/2.5: provider.one[index].unitPrice!/double.parse(provider.one[index].itemName.toString().split(" ").first)).toStringAsFixed(2)} /hr",style: GoogleFonts.inter(fontSize: 12* f,fontWeight: FontWeight.bold,color: Colors.green, )),
                                ],
                              ),
                              Text(provider.one[index].subTitle.toString(),style: GoogleFonts.inter(fontWeight: FontWeight.normal,fontSize: 12,),),
                            ],
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10 * h,);
                    },
            
                  ),
                   Align(
                    alignment: Alignment.topLeft,
                    child: Text("Mention any special instruction here.."
                   ,style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 10 * h,),
                  TextFieldWidget(controller: _editingController,hintText: "Mention any special instruction here..",hintStyle: GoogleFonts.inter(fontSize: 12),),
                  
             SizedBox(height: 200 * h,),
                ],
              ),
            );
          }
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer<DataProvider>(
        builder: (context,provider,child) {
          return Container(
            height: 90* h,
                      decoration: const BoxDecoration(

                        color: Colors.white,
                        boxShadow: [BoxShadow(
                        offset: Offset(2, 2),color: Color.fromRGBO(0, 0, 0, 0.16),
                        blurRadius:10,
                      )]),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(color: Colors.green.withOpacity(0.30),
                            ),
                            child: Center(child: Text("2 Promos available at checkout.",style: GoogleFonts.inter(fontSize: 11 * f,color: Colors.green,fontWeight: FontWeight.w600),),),
                          ),
                          SizedBox(height: 10 * h,),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 15* w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("AED ${provider.total.toStringAsFixed(2)}",style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.bold),),
                                    Row(
                                      children: [
                                        Text("View Order Summary",style: GoogleFonts.inter(color: const Color.fromARGB(255, 168, 133, 7),fontSize: 12),),
                                        
                                        Transform.rotate(angle: -pi/2,
                                          child: Icon(Icons.arrow_back_ios_new_outlined,size: 14,color: const Color.fromARGB(255, 184, 167, 8),))
                                      ],
                                    ),
                                  ],
                                ),
                          
                                InkWell(
                                  onTap: (){
                                   showModalBottomSheet( isScrollControlled: true,
          isDismissible: true,
          useSafeArea: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(12),
              topStart: Radius.circular(12),
            ),
          ),
          builder: (context) {
            return Container(
              margin:  EdgeInsets.only(bottom: 25* h),
            //  height: 100* h,
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 5,
              width: 135,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
            ),
            SizedBox(
              height: h * 15,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 236, 217),
                border: Border.all(color: Colors.grey)

              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${provider.cleanerCount} Cleaner, ${provider.cleanerHour}",style: GoogleFonts.inter(fontSize: 14),),
                      Text("Edit",style: GoogleFonts.inter(fontSize: 14,color: Colors.blue),)
                    ],
                  ),
                  Text("AED ${provider.total.toStringAsFixed(2)}",style:GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600))
                ],
              ),
            ),
            SizedBox(height: 10*h,),

             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sub Total",style: GoogleFonts.inter(fontSize: 14),),
                  
                    ],
                  ),
                  Text("AED ${provider.total.toStringAsFixed(2)}",style:GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600))
                ],
              ),
              SizedBox(height: 5*h,),
             Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total(Inclusive 5% VAT)",style: GoogleFonts.inter(fontSize: 14),),
                  
                    ],
                  ),
                  Text("AED ${provider.total.toStringAsFixed(2)}",style:GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600))
                ],
              ),
              
            
            ]));
          });
                                  },
                                  child: Container(
                                    width: 150 * w,
                                    height: 45 *h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: Color.fromARGB(255, 234, 189, 12),borderRadius: BorderRadius.circular(8),),
                                    child: Text("Proceed to Book",style: GoogleFonts.inter(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),),
                                  ),
                                )
                          
                              ],
                            ),
                          )
                        ],
                      ),
                    );
        }
      ),
    );
  }

  
    


  Widget cleanersWidegte({
    required DataProvider provider,
    required int index,
    required Items e
  }){
  
    
    return  InkWell(
                      onTap: () async{
                      
                       if(index == 0){
                           provider.select = Cleaners.one;
                           provider.selectColora =  Colors.yellow.withOpacity(0.20);;
                           provider.selectColorb = Colors.white;
                           provider.selectColorc = Colors.white;
                           provider.selectBordera = Colors.yellow;
                           provider.selectBorderb = Colors.grey;
                           provider.selectBorderc = Colors.grey;

                          
       provider.one = e.items!.toList();
        provider.selectedIndex =  e.items!.indexWhere((element) => element.isPrefer == true);
        provider.total = 0;
        provider.total =provider.one[provider.selectedIndex!].isPrefer == true? (provider.one[provider.selectedIndex!].unitPrice!/2.5): (provider.one[provider.selectedIndex!].unitPrice!/double.parse(provider.one[provider.selectedIndex!].itemName.toString().split(" ").first));
                          
        // dev.log(provider.one[provider.selectedIndex!].isPrefer == true ? (provider.one[provider.selectedIndex!].unitPrice!/(provider.one[index].unitPrice!.toDouble()/2.5)) :  (provider.one[provider.selectedIndex!].unitPrice!/double.parse(provider.one[provider.selectedIndex!].itemName.toString().split(" ").first))).toString())
        
        //  provider.total = provider.one[provider.selectedIndex!].isPrefer == true ? (provider.one[provider.selectedIndex!].unitPrice!/2.5) :  (provider.one[provider.selectedIndex!].unitPrice!/(double.parse(provider.one[provider.selectedIndex!].itemName.toString().split(" ").first)));
        //  provider.total =  (provider.one[provider.selectedIndex!].unitPrice!/(provider.one[index].unitPrice!.toDouble()/2.5));
       
    

                         debugPrint(provider.select.toString());
                       }else if(index ==1){
                          provider.select = Cleaners.two;
                          provider.selectColora = Colors.white;
                           provider.selectColorb =  Colors.yellow.withOpacity(0.20);
                           provider.selectColorc = Colors.white;
                             provider.selectBordera = Colors.grey;
                           provider.selectBorderb = Colors.yellow;
                           provider.selectBorderc = Colors.grey;
                           provider.one.clear();
                            provider.one = e.items!.toList();
                             provider.selectedIndex =  e.items!.indexWhere((element) => element.isPrefer == true);
                             provider.total =provider.one[provider.selectedIndex!].isPrefer == true? (provider.one[provider.selectedIndex!].unitPrice!/2.5): (provider.one[provider.selectedIndex!].unitPrice!/double.parse(provider.one[provider.selectedIndex!].itemName.toString().split(" ").first));
        debugPrint(provider.select.toString());
                       } else if(index == 2){
                         provider.select = Cleaners.three;
                         provider.selectColora = Colors.white;
                           provider.selectColorb = Colors.white;
                           provider.selectColorc =  Colors.yellow.withOpacity(0.20);
                             provider.selectBordera = Colors.grey;
                           provider.selectBorderb = Colors.grey;
                           provider.selectBorderc = Colors.yellow;
                            provider.one.clear();
                            provider.one = e.items!.toList();
                             provider.selectedIndex =  e.items!.indexWhere((element) => element.isPrefer == true);
                            provider.total =provider.one[provider.selectedIndex!].isPrefer == true? (provider.one[provider.selectedIndex!].unitPrice!/2.5): (provider.one[provider.selectedIndex!].unitPrice!/double.parse(provider.one[provider.selectedIndex!].itemName.toString().split(" ").first));
        debugPrint(provider.select.toString());
                       }

                       
                  
                       
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15* w),
                        height: 45,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: index == 0 ? provider.selectColora: index== 1 ? provider.selectColorb : provider.selectColorc,
                        borderRadius: BorderRadius.circular(8),border: Border.all(color: index == 0 ? provider.selectBordera: index== 1 ? provider.selectBorderb : provider.selectBorderc,width: 2
                        ),
                      
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.network("${e.image}/",),
                              Text(e.displayOrder.toString())
                            ],
                          ),
                        ),
                      ),
                    );
  }
}