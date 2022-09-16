import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lymphowear_remote_app/pages/home_none.dart';
import 'package:lymphowear_remote_app/pages/pairing/pairing_loading.dart';

class PairingPage extends StatefulWidget {
  const PairingPage({Key? key}) : super(key: key);

  @override
  State<PairingPage> createState() => _PairingPageState();
}

class _PairingPageState extends State<PairingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const PairingPageAppbar(),
      body: PairingPageBody(),
    );
  }
}

class PairingPageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PairingPageAppbar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  IconButton appbarIconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      color: Colors.grey[700],
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeNone(),
        ));
      },
    );
  }

  Text appbarTitle(context) {
    return Text(
      'Add Device',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: appbarIconButton(context),
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      title: appbarTitle(context),
      bottom: PreferredSize(
          preferredSize: preferredSize,
          child: Container(
            color: Colors.grey[200],
            height: 2.0,
          )),
      centerTitle: true,
    );
  }
}

class PairingPageBody extends StatelessWidget {
  PairingPageBody({Key? key}) : super(key: key);

  final image = SvgPicture.asset(
    'assets/images/pairing01_image.svg',
  );

  Text title(context) {
    return Text(
      'Turn on the power of LymphoWear',
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Text content(context) {
    return Text(
      "전원을 켜지 않으면 기기를 연결할 수 없습니다.\n만약 전원이 켜지지 않는다면,\n기기를 충전하고 다시 시도해주세요.",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 59, 0, 32),
              child: image,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: title(context),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: content(context),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              child: const PairingPageBottomButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class PairingPageBottomButton extends StatelessWidget {
  const PairingPageBottomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        backgroundColor: const Color(0xff008A40),
        foregroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.button,
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const PairingLoading()),
            ));
      },
      child: const Text(
        'Start',
      ),
    );
  }
}
