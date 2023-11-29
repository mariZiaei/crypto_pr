import 'package:flutter/material.dart';

import 'package:flutter_application_crypto/data/model/crypto.dart';

class CryptoPage extends StatefulWidget {
  CryptoPage({super.key, this.cryptoList});
  List<Crypto>? cryptoList;
  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  List<Crypto>? cryptoList;

  @override
  void initState() {
    super.initState();
    cryptoList = widget.cryptoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView.builder(
                itemCount: cryptoList!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(cryptoList![index].name),
                      subtitle: Text(cryptoList![index].symbol),
                      leading: SizedBox(
                        width: 30,
                        child: Center(
                          child: Text(cryptoList![index].rank.toString()),
                        ),
                      ),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(cryptoList![index]
                                    .priceUsd
                                    .toStringAsExponential(2)),
                                Text(cryptoList![index]
                                    .changePercent24Hr
                                    .toStringAsExponential(2))
                              ],
                            ),
                            SizedBox(
                              width: 30,
                              child: Center(
                                child: getIconChange(
                                    cryptoList![index].changePercent24Hr),
                              ),
                            )
                          ],
                        ),
                      ));
                })));
  }

  Widget getIconChange(double percentChange) {
    return percentChange <= 0
        ? Icon(
            Icons.trending_down,
            size: 24,
            color: Colors.red,
          )
        : Icon(
            Icons.trending_up,
            size: 24,
            color: Colors.green,
          );
  }
}
