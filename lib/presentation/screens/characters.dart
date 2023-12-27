
import '../../buisness_logic/api_result/network_exceptions.dart';
import '../../buisness_logic/cubit/character_cubit.dart';
import '../../buisness_logic/cubit/result_state.dart';
import '../../constant/mycolors/mycolors.dart';
import '../../data/models/character_model.dart';
import 'character_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  Character allCharacter = Character();

  //late Results results;

  bool _isSearching = false;
  Character searchedForCharacters = Character();
  final _searchTextController = TextEditingController();
  Widget _buildSearchFeild() {
    return TextFormField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Search in Characters ...',
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: const TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchedfotItemsToSearchedList(searchedCharacter);
      },
    );
  }

  //List<Results>? bb = allCharacter.results ;
  void addSearchedfotItemsToSearchedList(String searchedCharacter) {
    print(allCharacter);


    //مش شغااااالة
    if (allCharacter.results != null) {
      searchedForCharacters.results = allCharacter.results!
          .where((character) =>
              character.name!.toLowerCase().startsWith(searchedCharacter))
          .toList();
    }
    print(' ${allCharacter.toString()}');
    print(searchedForCharacters.results);

    setState(() {
      print(searchedForCharacters.results);
    });
  }

  List<Widget> _buildAppBarIcon() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: MyColors.myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            _startSearch();
          },
          icon: const Icon(
            Icons.search,
            color: MyColors.myGrey,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    
    BlocProvider.of<CharacterCubit>(context).emitGetAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharacterCubit, ResultState<dynamic>>(
      builder: (context, ResultState<dynamic> state) {
        return state.when(
          idle: () {
            return const Center(child: CircularProgressIndicator());
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
          success: (dynamic allCharacter) {
            return buildlodedItsWidget(
                allCharacter: _searchTextController.text.isEmpty
                    ? allCharacter
                    : searchedForCharacters);
            //  Container(
            //   height: 50,
            //   color: Colors.red,
            //   child: Center(
            //       child: Text(
            //     userData.results![0].name.toString(),
            //     style: const TextStyle(color: Colors.white),
            //   )),
            // );
          },
          error: (NetworkExceptions error) {
            return Center(
                child: Text(NetworkExceptions.getErrorMessage(error)));
          },
        );
      },
    );
  }

  Widget buildlodedItsWidget({required Character allCharacter}) {
    return SingleChildScrollView(
      //  physics: const BouncingScrollPhysics(),
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharacterList(
              allCharacter: _searchTextController.text.isEmpty
                  ? allCharacter
                  : searchedForCharacters,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCharacterList({required Character allCharacter}) {
    return GridView.builder(
      itemCount: _searchTextController.text.isEmpty
          ? allCharacter.results?.length ?? 0
          : searchedForCharacters.results?.length ?? 0,
      //  allCharacters.results!.length,
      //allCharacters.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        //////////////
        return Container(
          width: double.infinity,
          margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: MyColors.myWhite,
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterDetailsScreen(
                      character: allCharacter.results![index]),
                )),
            child: GridTile(
              // ignore: sort_child_properties_last
              child: Hero(
                tag: allCharacter.results![index].id!,
                child: Container(
                  color: MyColors.myGrey,
                  child: allCharacter.results![index].image!.isNotEmpty
                      ? FadeInImage.assetNetwork(
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: 'assets/images/loading.gif',
                          image: _searchTextController.text.isEmpty
                              ? allCharacter.results![index].image!
                              : searchedForCharacters.results![index].image!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset('assets/images/123.jpg'),
                ),
              ),

              footer: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.black54,
                alignment: Alignment.bottomCenter,
                child: Text(
                  _searchTextController.text.isEmpty
                      ? allCharacter.results![index].name.toString()
                      : searchedForCharacters.results![index].name.toString(),
                  style: const TextStyle(
                    // color: Colors.black,
                    color: MyColors.myWhite,
                    height: 1.2,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        );

        // CharacterItem(
        //    allCharacter:  _searchTextController.text.isEmpty
        //       ? allCharacter.results![index]
        //       : searchedForCharacters.results![index],
        // );
      },
    );
  }

  Widget buildAppBaraTitle() {
    return const Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset('assets/images/no_internet.jpg')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching
            ? const BackButton(color: MyColors.myGrey)
            : Container(
                width: 0,
              ),
        backgroundColor: MyColors.myYellow,
        title: _isSearching ? _buildSearchFeild() : buildAppBaraTitle(),
        actions: _buildAppBarIcon(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return buildBlocWidget();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: showLoadingIndicator(),
      ),
    );
  }
}
