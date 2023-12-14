import 'package:flutter/material.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/quiz_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vamos aprender? ",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color:Color.fromARGB(255, 128, 128, 192),

                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Eu estou pronto e você?",
                      style: TextStyle(
                        color:Color.fromARGB(255, 2, 2, 192),
                      ),
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  child: Text(
                    "J.N",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 140,
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adicione o codigo da sua categoria",
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        const Text("Para jogar com seus amigos"),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Adicionar codigo",
                                  filled: true,
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Entrar"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
