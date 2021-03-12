////
////  File.swift
////
////
////  Created by Jesulonimi on 2/10/21.
////
//import Ed25519
//import Foundation
//import Alamofire
////14077815
//var PURESTAKE_ALGOD_API_TESTNET_ADDRESS="https://testnet-algorand.api.purestake.io/ps2";
//var PURESTAKE_ALGOD_API_MAINNET_ADDRESS="https://mainnet-algorand.api.purestake.io/ps2";
//var PURESTAKE_INDEXER_API_ADDRESS="https://testnet-algorand.api.purestake.io/idx2";
//var PURESTAKE_API_KEY="";
//var PURESTAKE_API_PORT="443";
//var HACKATHON_API_PORT="9100";
//var HACKATHON_API_ADDRESS="http://hackathon.algodev.network";
//var HACKATHON_API_TOKEN="ef920e2e7e002953f4b29a8af720efe8e4ecc75ff102b165e0472834b25832c1";
////var algodClient=AlgodClient(host: HACKATHON_API_ADDRESS, port: HACKATHON_API_PORT, token: HACKATHON_API_TOKEN)
//var algodClient=AlgodClient(host: PURESTAKE_ALGOD_API_TESTNET_ADDRESS, port: PURESTAKE_API_PORT, token: PURESTAKE_API_KEY)
//algodClient.set(key: "X-API-Key")
//var indexerClient=IndexerClient(host: PURESTAKE_INDEXER_API_ADDRESS, port: PURESTAKE_API_PORT, token: PURESTAKE_API_KEY)
//indexerClient.set(key:"X-API-Key")
//let queue = DispatchQueue(label: "com.knowstack.queue1")
//var mnemonic="cactus check vocal shuffle remember regret vanish spice problem property diesel success easily napkin deposit gesture forum bag talent mechanic reunion enroll buddy about attract"
//var mnemonic2="box wear empty voyage scout cheap arrive father wagon correct thought sand planet comfort also patient vast patient tide rather young cinnamon plastic abandon model";
//var account =  try Account(mnemonic2)
//var account1 = try Account(mnemonic)
//var address = account.getAddress()
//print(address.description)
//
//
////testLookAccountById()
////testSearchForAccounts()
////testLookAccountTrans()
////testLookUpAssetTransactions()
////testSearchForApplications()
////testLookForApplication()
////testLookUpBlock()
////testGetStatus()
//
////try! testPayment(mnemonic:mnemonic)
////testMultisigCreationAndTransaction()
////algodClient.pendingTransactionInformation(txId: "XROWUBWK6FTT7RDQKDONLJED4WJ2H563MNNGRYQP544GSNFSKKTA").execute(){ pendingTransactionResponse in
////        if(pendingTransactionResponse.isSuccessful){
////            print(pendingTransactionResponse.data!.confirmedRound)
////        }else{
////            print(pendingTransactionResponse.errorDescription!)
////            print("Errir")
////        }
////}
//
//
////testAtomicTransfer()
//
////var account =  try Account(mnemonic)
//
//
//
//dispatchMain()
//
//
//
//
//
//func testPayment(mnemonic:String) throws{
//    var account =  try Account(mnemonic)
//    var senderAddress = account.getAddress()
//    var receiverAddress = try! Address("FMBQKMGDE7LYNDHCSUPJBXNMMT3HC2TXMIFAJKGBYJQDZN4R3M554N4QTY")
//
//
//        var trans =  algodClient.transactionParams().execute(){ paramResponse in
//            if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//
//
//           var tx = Transaction.paymentTransactionBuilder().setSender(senderAddress)
//            .amount(10)
//            .receiver(receiverAddress)
//            .note("Swift Algo sdk is cool".bytes)
//            .suggestedParams(params: paramResponse.data!)
//            .build()
//
//
//            var signedTransaction=account.signTransaction(tx: tx)
//
//            var encodedTrans:[Int8]=CustomEncoder.encodeToMsgPack(signedTransaction)
//
//
//
//            algodClient.rawTransaction().rawtxn(rawtaxn: encodedTrans).execute(){
//               response in
//                if(response.isSuccessful){
//                    print(response.data!.txId)
//
//                }else{
//                    print(response.errorDescription)
//                    print("Faled")
//                }
//
//            }
//    }
//}
//
//func testCreateASA(address:Address,algodClient:AlgodClient){
//    algodClient.transactionParams().execute(){paramResponse in
//        if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//        var tx = Transaction.assetCreateTransactionBuilder()
//                      .setSender(address)
//                      .setAssetTotal(assetTotal: 10000)
//                      .setAssetDecimals(assetDecimals:  0)
//                      .assetUnitName(assetUnitName: "ssawttes")
//                      .assetName(assetName:  "testssswt")
//                        .url(url: "http://nimi.com")
//                        .metadataHashUTF8(metadataHash: "16efaa3924a6fd9d3a4824799a4ac65d")
//                        .manager(manager: address)
//                        .reserve(reserve: address)
//                        .freeze(freeze: address)
//                      .defaultFrozen(defaultFrozen:  false)
//            .clawback(clawback: address)
//            .suggestedParams(params: paramResponse.data!)
//    //        .firstValid(1000)
//    //        .genesisHash([72,99,-75,24,-92,-77,-56,78,-56,16,-14,45,79,16,-127,-53,15,113,-16, 89, -89,-84,32, -34,-58,47,127,112,-27, 9, 58,34,])
//            //        .suggestedParams(params: paramResponse.data!)
//                      .build();
//
//        var txMessagePack:[Int8]=CustomEncoder.encodeToMsgPack(tx)
//        print(txMessagePack)
//
//        var jsonencoder=JSONEncoder()
//        var signedTransaction=account.signTransaction(tx: tx)
//        var stxData=try! jsonencoder.encode(signedTransaction)
//        var stxString=String(data: stxData, encoding: .utf8)
//        print(stxString)
//        print(tx.txID())
//        var encodedTrans:[Int8]=CustomEncoder.encodeToMsgPack(signedTransaction)
//        print(encodedTrans)
//        var dataToSend=Data(CustomEncoder.convertToUInt8Array(input: encodedTrans))
//    //        let headers:HTTPHeaders=["X-Algo-API-Token":HACKATHON_API_TOKEN]
//    //        AF.request("http://hackathon.algodev.network:9100/v2/transactions/",method: .post, parameters: nil, encoding: ByteEncoding(data: dataToSend), headers: headers).responseJSON(){ data in
//    //            debugPrint(data)
//    //
//    //        }
//
//        print(try!account.keyPair.verify(signature: CustomEncoder.convertToUInt8Array(input: signedTransaction.sig!.bytes!), message: CustomEncoder.convertToUInt8Array(input: tx.bytesToSign())))
//        algodClient.rawTransaction().rawtxn(rawtaxn: encodedTrans).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//            }else{
//                print(response.errorDescription)
//            }
//
//        }
//
//    }
//
//}
//
//func testChangeAsaManager(){
//    algodClient.transactionParams().execute(){paramResponse in
//        if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//        var tx = Transaction.assetConfigureTransactionBuilder().reserve(reserve: address).freeze(freeze: address).clawback(clawback: address).assetIndex(assetIndex: 14066442).setSender(account1.getAddress())
//        .manager(manager: account1.getAddress())
//            .suggestedParams(params: paramResponse.data!)
//                  .build();
//    //tx.assetIndex=14000663
//    var jsonencoder=JSONEncoder()
//    var txStringData=try!jsonencoder.encode(tx)
//    var txString=String(data:txStringData,encoding: .utf8)
//    print(txString)
//        var signedTransaction=account1.signTransaction(tx: tx)
//        var stxData=try! jsonencoder.encode(signedTransaction)
//        var stxString=String(data: stxData, encoding: .utf8)
//        print(stxString)
//        print(tx.txID())
//        var encodedTrans:[Int8]=CustomEncoder.encodeToMsgPack(signedTransaction)
//        print(encodedTrans)
//        var dataToSend=Data(CustomEncoder.convertToUInt8Array(input: encodedTrans))
//    //        let headers:HTTPHeaders=["X-Algo-API-Token":HACKATHON_API_TOKEN]
//    //        AF.request("http://hackathon.algodev.network:9100/v2/transactions/",method: .post, parameters: nil, encoding: ByteEncoding(data: dataToSend), headers: headers).responseJSON(){ data in
//    //            debugPrint(data)
//    //
//    //        }
//
//        algodClient.rawTransaction().rawtxn(rawtaxn: encodedTrans).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//            }else{
//                print(response.errorDescription)
//            }
//
//        }
//
//    }
//
//}
//
//func testDestroyASA(){
//    algodClient.transactionParams().execute(){paramResponse in
//        if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//        var tx = Transaction.assetDestroyTransactionBuilder()
//            .setSender(account1.getAddress())
//            .assetIndex(assetIndex: 14066442)
//            .suggestedParams(params: paramResponse.data!)
//                      .build();
//
//        var txMessagePack:[Int8]=CustomEncoder.encodeToMsgPack(tx)
//        print(txMessagePack)
//        print(txMessagePack.count)
//
//        var signedTrans=account1.signTransaction(tx: tx)
//        var encodedTx:[Int8]=CustomEncoder.encodeToMsgPack(signedTrans)
//        algodClient.rawTransaction().rawtxn(rawtaxn: encodedTx).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//            }else{
//                print(response.errorDescription)
//            }
//
//        }}
//
//}
//func testAsaOptIn(){
//
//    algodClient.transactionParams().execute(){paramResponse in
//        if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//        var tx = Transaction.assetAcceptTransactionBuilder()
//            .acceptingAccount(acceptingAccount: account1.getAddress())
//            .assetIndex(assetIndex: 14077815)
//            .suggestedParams(params: paramResponse.data!)
//    //        .firstValid(1000)
//    //        .genesisHash([72,99,-75,24,-92,-77,-56,78,-56,16,-14,45,79,16,-127,-53,15,113,-16, 89, -89,-84,32, -34,-58,47,127,112,-27, 9, 58,34,])
//            .build();
//
//        var txMessagePack:[Int8]=CustomEncoder.encodeToMsgPack(tx)
//        print(txMessagePack)
//        print(txMessagePack.count)
//        var signedTrans=account1.signTransaction(tx: tx)
//        var jsonEncoder=JSONEncoder()
//        var stxBytes=try!jsonEncoder.encode(signedTrans)
//        var stxString=String(data: stxBytes, encoding: .utf8)
//        print(stxString!)
//        var encodedTx:[Int8]=CustomEncoder.encodeToMsgPack(signedTrans)
//        algodClient.rawTransaction().rawtxn(rawtaxn: encodedTx).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//            }else{
//                print(response.errorDescription)
//            }
//
//        }}
//
//}
//
//
//func testAssetTransfer(){
//
//    algodClient.transactionParams().execute(){paramResponse in
//        if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//
//        var tx = Transaction.assetTransferTransactionBuilder().setSender(account.getAddress()).assetReceiver(assetReceiver: account1.getAddress())
//            .assetAmount(assetAmount:10).assetIndex(assetIndex:14077815).suggestedParams(params:paramResponse.data!).build();
//
//        var txMessagePack:[Int8]=CustomEncoder.encodeToMsgPack(tx)
//        print(txMessagePack)
//        print(txMessagePack.count)
//        var signedTrans=account.signTransaction(tx: tx)
//        var jsonEncoder=JSONEncoder()
//        var stxBytes=try!jsonEncoder.encode(signedTrans)
//        var stxString=String(data: stxBytes, encoding: .utf8)
//        print(stxString!)
//        var encodedTx:[Int8]=CustomEncoder.encodeToMsgPack(signedTrans)
//        algodClient.rawTransaction().rawtxn(rawtaxn: encodedTx).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//            }else{
//                print(response.errorDescription)
//            }
//
//        }
//    }
//
//}
//func testAssetFreeze(){
//
//    algodClient.transactionParams().execute(){paramResponse in
//        if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//
//        var tx=Transaction.assetFreezeTransactionBuilder().setSender(account.getAddress()).freezeTarget(freezeTarget:account1.getAddress())
//            .freezeState(freezeState:false).assetIndex(assetIndex: 14077815).suggestedParams(params: paramResponse.data!).build();
//
//        var txMessagePack:[Int8]=CustomEncoder.encodeToMsgPack(tx)
//        print(txMessagePack)
//        print(txMessagePack.count)
//        var signedTrans=account.signTransaction(tx: tx)
//        var jsonEncoder=JSONEncoder()
//        var stxBytes=try!jsonEncoder.encode(signedTrans)
//        var stxString=String(data: stxBytes, encoding: .utf8)
//        print(stxString!)
//        var encodedTx:[Int8]=CustomEncoder.encodeToMsgPack(signedTrans)
//        algodClient.rawTransaction().rawtxn(rawtaxn: encodedTx).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//            }else{
//                print(response.errorDescription)
//            }
//
//        }
//    }
//
//}
//func testAsaClawback(){
//    algodClient.transactionParams().execute(){paramResponse in
//        if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//
//        var tx = Transaction.assetClawbackTransactionBuilder().setSender(account.getAddress())
//            .assetClawbackFrom(assetClawbackFrom:account1.getAddress()).assetReceiver(assetReceiver: account.getAddress()).assetAmount(assetAmount: 10)
//            .assetIndex(assetIndex:14077815).suggestedParams(params: paramResponse.data!).build();
//        var txMessagePack:[Int8]=CustomEncoder.encodeToMsgPack(tx)
//        print(txMessagePack)
//        print(txMessagePack.count)
//        var signedTrans=account.signTransaction(tx: tx)
//        var jsonEncoder=JSONEncoder()
//        var stxBytes=try!jsonEncoder.encode(signedTrans)
//        var stxString=String(data: stxBytes, encoding: .utf8)
//        print(stxString!)
//        var encodedTx:[Int8]=CustomEncoder.encodeToMsgPack(signedTrans)
//        algodClient.rawTransaction().rawtxn(rawtaxn: encodedTx).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//            }else{
//                print(response.errorDescription)
//            }
//
//        }
//    }
//}
//
//func testMultisigCreationAndTransaction(){
//    var ed25519i=Ed25519PublicKey(bytes: CustomEncoder.convertToInt8Array(input: account.keyPair.publicKey.bytes))
//    var ed25519ii=Ed25519PublicKey(bytes: CustomEncoder.convertToInt8Array(input: account1.keyPair.publicKey.bytes))
//    var multisigAddress=try! MultisigAddress(version: 1, threshold: 2, publicKeys: [ed25519ii,ed25519i]);
//    print(multisigAddress.toString())
//    algodClient.transactionParams().execute(){ paramResponse in
//        if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//
//        var tx = Transaction.paymentTransactionBuilder()
//            .setSender( try! multisigAddress.toAddress())
//            //            .suggestedParams(params: paramResponse.data!)
//              .amount(10)
//            .receiver(account.getAddress())
//    //           .firstValid(1000)
//    //                .genesisHash([72,99,-75,24,-92,-77,-56,78,-56,16,-14,45,79,16,-127,-53,15,113,-16, 89, -89,-84,32, -34,-58,47,127,112,-27, 9, 58,34,])
//            .suggestedParams(params: paramResponse.data!)
//                      .build();
//
//        var IsignedTrans = try! account.signMultisigTransaction(from: multisigAddress, tx: tx)
//        var signedTrans=try!account1.appendMultisigTransaction(from: multisigAddress, signedTx: IsignedTrans)
//        var signedTransmsgPack=CustomEncoder.convertToUInt8Array(input: CustomEncoder.encodeToMsgPack(signedTrans))
//    var int8sT:[Int8] = CustomEncoder.encodeToMsgPack(signedTrans)
//        print(int8sT)
//        print(signedTransmsgPack.count)
//    var jsonEncoder=JSONEncoder()
//    var txData=try! jsonEncoder.encode(signedTrans)
//    var txString=String(data: txData, encoding: .utf8)
//    print(txString!)
//
//        algodClient.rawTransaction().rawtxn(rawtaxn: CustomEncoder.encodeToMsgPack(signedTrans)).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//
//            }else{
//                print(response.errorDescription)
//            }
//
//        }
//
//
//    }
//
//}
//public func testGetStatus(){
//    algodClient.getStatus().execute(){nodeStatusResponse in
//        if(nodeStatusResponse.isSuccessful){
//            print(nodeStatusResponse.data!.lastRound)
//        }else{
//            print(nodeStatusResponse.errorDescription)
//        }
//
//    }
//    //try! testPayment(mnemonic:mnemonic)
//
//    algodClient.pendingTransactionInformation(txId: "HPS2AQU26NNVTFIJVBYYZN2P2T73AONKWCS7HPT5JUQEQMXFHMJA").execute(){ pendingTransactionResponse in
//            if(pendingTransactionResponse.isSuccessful){
//                print(pendingTransactionResponse.data!.confirmedRound)
//            }else{
//                print(pendingTransactionResponse.errorDescription!)
//                print("Errir")
//            }
//    }
//
//}
//public func testGetHealth(){
//    indexerClient.makeHealthCheck().execute(){ response in
//        if response.isSuccessful{
//            print(response.data!.message)
//            print(response.data!.data!["migration-required"])
//            print(response.data!.data![ "read-only-node"])
//        }else{
//            print(response.errorDescription)
//        }
//    }
//}
//
//public func testLookAccountTrans(){
//    indexerClient.lookUpAccountTransactions(address: "LL2ZGXSHW7FJGOOVSV76RRZ6IGU5ZF4DPCHQ23G7ZLIWCB4WEMIATDBTLY").execute(){response in
//        if response.isSuccessful{
//                print("success")
//            print(response.data!.transactions![0].fee)
//        }else{
//            print(response.errorDescription)
//        }
//    }
//}
//
//public func testLookAccountById(){
//    indexerClient.lookUpAccountById(address: "LL2ZGXSHW7FJGOOVSV76RRZ6IGU5ZF4DPCHQ23G7ZLIWCB4WEMIATDBTLY").execute(){response in
//
//        if response.isSuccessful{
//                print("success")
//            print(response.data!.currentRound)
//            print(response.data!.account!.appsLocalState)
//
//        }else{
//            print(response.errorDescription)
//        }
//    }
//
//}
//
//public func testSearchForApplications(){
//    indexerClient.searchForApplications().execute(){ response in
//        if response.isSuccessful{
//            print(response.data!.applications?[0].params?.approvalProgram)
//        }else{
//            print(response.errorDescription)
//        }
//    }
//
//}
//
//public func testLookForApplication(){
//    indexerClient.lookUpApplicationsById(id:12174882).execute(){ response in
//        if response.isSuccessful{
//            print(response.data!.application?.params?.approvalProgram)
//        }else{
//            print(response.errorDescription)
//        }
//    }
//
//}
//
//public func testSearchForAssets(){
//    indexerClient.searchForAssets()/*.limit(limit:10).unit(unit:"LAT") */.assetId(assetId:14077815).execute(){ response in
//        if response.isSuccessful{
//            print(response.data!.asset![0].params!.creator!)
//        }else{
//            print(response.errorDescription)
//            print("Error");
//        }
//    }
//}
//public func testIndexerLooKUpAssetByid(){
//    indexerClient.lookUpAssetById(id:14077815).execute(){response in
//
//        if response.isSuccessful{
//                print("success")
//            print(response.data!.asset!.params!.creator!)
//        }else{
//            print(response.errorDescription)
//            print("Error");
//
//        }
//    }
//}
//public func testSearchForTransactions(){
//    indexerClient.searchForTransactions().txid(txid:"HPS2AQU26NNVTFIJVBYYZN2P2T73AONKWCS7HPT5JUQEQMXFHMJA").execute(){ response in
//        if response.isSuccessful{
//            print(response.data!.transactions![0].confirmedRound)
//            print(response.data!.transactions![0].txType?.rawValue)
//            print("success")
//        }else{
//            print(response.errorDescription)
//            print("failure")
//
//        }
//    }
//}
//
//public func testSearchForAccounts(){
//    indexerClient.searchForAccounts().assetId(assetId: 14077815).execute(){ response in
//        if response.isSuccessful{
//            print(response.data!.accounts![0].address)
//        }else{
//            print(response.errorDescription)
//        }
//    }
//}
//
//public func testLookUpBlock(){
//    indexerClient.lookUpBlocks(roundNumber: 12471917).execute(){response in
//
//        if response.isSuccessful{
//                print("success")
//            print(response.data!.genesisHash)
//            print(response.data!.genesisId)
//            print(response.data!.rewards!.feeSink)
//            print(response.data!.round)
//            print(response.data!.upgradeVote?.upgradeApprove)
//            print(response.data!.upgradeState?.currentProtocol)
//
//        }else{
//            print(response.errorDescription)
//        }
//    }
//}
//
//public func testLookUpAssetTransactions(){
//
//
//    indexerClient.lookupAssetTransactions(assetId:14077815).execute(){response in
//
//        if response.isSuccessful{
//                print("success")
//            print(response.data!.transactions![0].fee)
//
//        }else{
//            print(response.errorDescription)
//        }
//    }
//
//}
//
//public func testLookUpAssetBalnces(){
//    indexerClient.lookUpAssetBalances(assetId:14077815).execute(){response in
//        if response.isSuccessful{
//                print("success")
//            print(response.data!.balances![0].amount)
//
//        }else{
//            print(response.errorDescription)
//        }
//    }
//}
////
//public func testAtomicTransfer(){
//    var senderAddress = account.getAddress()
//    var receiverAddress = try! Address("FMBQKMGDE7LYNDHCSUPJBXNMMT3HC2TXMIFAJKGBYJQDZN4R3M554N4QTY")
//
//
//        var trans =  algodClient.transactionParams().execute(){ paramResponse in
//            if(!(paramResponse.isSuccessful)){
//            print(paramResponse.errorDescription);
//            return;
//        }
//
//
//           var tx1 = Transaction.paymentTransactionBuilder().setSender(senderAddress)
//            .amount(8)
//            .receiver(receiverAddress)
//            .note("Swift Algo sdk is cool".bytes)
//            .suggestedParams(params: paramResponse.data!)
//            .build()
//
//            var tx2 = Transaction.paymentTransactionBuilder().setSender(senderAddress)
//             .amount(9)
//             .receiver(receiverAddress)
//             .note("Swift Algo sdk is cool".bytes)
//             .suggestedParams(params: paramResponse.data!)
//             .build()
//
//            var tx3 = Transaction.paymentTransactionBuilder().setSender(senderAddress)
//             .amount(10)
//             .receiver(receiverAddress)
//             .note("Swift Algo sdk is cool".bytes)
//             .suggestedParams(params: paramResponse.data!)
//             .build()
//
//
//            var tx4 = Transaction.paymentTransactionBuilder().setSender(senderAddress)
//             .amount(11)
//             .receiver(receiverAddress)
//             .note("Swift Algo sdk is cool".bytes)
//             .suggestedParams(params: paramResponse.data!)
//             .build()
//
//            print(tx1.txID())
//            print(tx2.txID())
//            var transactions=[tx1,tx2,tx3,tx4]
//            var gid = try! TxGroup.computeGroupID(txns: transactions)
//            print( CustomEncoder.encodeToBase32StripPad(gid.bytes!))
//            var signedTransactions:[SignedTransaction]=Array(repeating: SignedTransaction(), count: transactions.count)
//
//            for i in 0..<transactions.count{
//                transactions[i].assignGroupID(gid: gid)
//
//                signedTransactions[i]=account.signTransaction(tx: transactions[i])
//
//
//            }
//
//            for i in 0..<transactions.count{
//                print( CustomEncoder.encodeToBase32StripPad((signedTransactions[i].tx?.group?.bytes)!))
//
//
//            }
//            var transactionss=[tx1,tx2]
//            var gidd = try! TxGroup.computeGroupID(txns: transactions)
//
//            print( CustomEncoder.encodeToBase32StripPad(gidd.bytes!))
//    //
//    //
//    //        var signedTransaction=account.signTransaction(tx: tx)
//
//    //        var signedTransaction=signedTransactions[0]+signedTransactions[1]+signedTransactions[2]
//            var encodedTrans:[Int8]=CustomEncoder.encodeToMsgPack(signedTransactions[0])+CustomEncoder.encodeToMsgPack(signedTransactions[1])
//            + CustomEncoder.encodeToMsgPack(signedTransactions[2])+CustomEncoder.encodeToMsgPack(signedTransactions[3])
//
//
//
//            algodClient.rawTransaction().rawtxn(rawtaxn: encodedTrans).execute(){
//               response in
//                if(response.isSuccessful){
//                    print(response.data!.txId)
//
//                }else{
//                    print(response.errorDescription)
//                    print("Failed")
//                }
//
//            }
//    }
//
//}
//
//public func testSplitProgram(){
//
//    var lsig=LogicsigSignature(logicsig: [1, 32, 8, 1, -48, 15, 2, 0, -64, -106, -79, 2, 7, 3, -72, 23, 38, 3, 32, -2, -68, -96, -69, 20, 74, 90, 78, -89, -76, 56, -92, 104, 26, -56, 14, 108, -95, 5, -68, -74, 7, -4, 86, 83, 37, -55, 86, -107, -10, -94, 19, 32, -103, -32, 115, 15, -121, 33, 36, -25, -55, 41, -58, 11, -66, 50, -54, 114, 59, -13, -36, 55, -27, -29, -19, -111, -31, 80, -84, -9, 36, -35, 85, 30, 32, 2, 90, -46, -63, -65, 28, -93, -8, 19, 31, -9, -85, -12, -116, -37, -21, -98, -50, -17, 50, 105, 126, 42, 107, -36, 5, -100, -22, 26, 89, 11, 22, 49, 16, 34, 18, 49, 1, 35, 12, 16, 50, 4, 36, 18, 64, 0, 25, 49, 9, 40, 18, 49, 7, 50, 3, 18, 16, 49, 8, 37, 18, 16, 49, 2, 33, 4, 13, 16, 34, 64, 0, 46, 51, 0, 0, 51, 1, 0, 18, 49, 9, 50, 3, 18, 16, 51, 0, 7, 41, 18, 16, 51, 1, 7, 42, 18, 16, 51, 0, 8, 33, 5, 11, 51, 1, 8, 33, 6, 11, 18, 16, 51, 0, 8, 33, 7, 15, 16, 16])
//
//
//    var trans =  algodClient.transactionParams().execute(){ paramResponse in
//        if(!(paramResponse.isSuccessful)){
//        print(paramResponse.errorDescription);
//        return;
//    }
//
//
//       var tx1 = Transaction.paymentTransactionBuilder().setSender(try! Address("FABHMDUB2ACZR657MK3ECLSQKD2ILD5CGWYYYOVPWL37RUROTNUY36FXMQ"))
//        .amount(15000)
//        .receiver(try! Address("THQHGD4HEESOPSJJYYF34MWKOI57HXBX4XR63EPBKCWPOJG5KUPDJ7QJCM"))
//    //    .note("Swift Algo sdk is cool".bytes)
//        .suggestedParams(params: paramResponse.data!)
//        .build()
//
//        var tx2 = Transaction.paymentTransactionBuilder().setSender(try! Address("FABHMDUB2ACZR657MK3ECLSQKD2ILD5CGWYYYOVPWL37RUROTNUY36FXMQ"))
//         .amount(35000)
//         .receiver(try! Address("AJNNFQN7DSR7QEY766V7JDG35OPM53ZSNF7CU264AWOOUGSZBMLMSKCRIU"))
//    //     .note("Swift Algo sdk is cool".bytes)
//         .suggestedParams(params: paramResponse.data!)
//         .build()
//
//        print(tx1.txID())
//        print(tx2.txID())
//        var transactions=[tx1,tx2]
//        var gid = try! TxGroup.computeGroupID(txns: transactions)
//        var signedTransactions:[SignedTransaction]=Array(repeating: SignedTransaction(), count: transactions.count)
//
//        for i in 0..<transactions.count{
//            transactions[i].assignGroupID(gid: gid)
//            signedTransactions[i]=SignedTransaction(tx: transactions[i], lSig: lsig, txId: transactions[i].txID())
//        }
//
//
//    //
//    //        var signedTransaction=account.signTransaction(tx: tx)
//
//    //        var signedTransaction=signedTransactions[0]+signedTransactions[1]+signedTransactions[2]
//        var encodedTrans:[Int8]=CustomEncoder.encodeToMsgPack(signedTransactions[0])+CustomEncoder.encodeToMsgPack(signedTransactions[1])
//
//    print(encodedTrans)
//        algodClient.rawTransaction().rawtxn(rawtaxn: encodedTrans).execute(){
//           response in
//            if(response.isSuccessful){
//                print(response.data!.txId)
//
//            }else{
//                print(response.errorDescription)
//                print("Failed")
//            }
//
//        }
//    }
//
//}