// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button.stories.dart';

// **************************************************************************
// StoryGenerator
// **************************************************************************

final ButtonPresenterComponent =
    LeafComponent<ButtonPresenter, ButtonPresenterArgs>(
  meta: meta,
  story: $PrimaryMain,
);
typedef ButtonPresenterScenario
    = Scenario<ButtonPresenter, ButtonPresenterArgs>;

class ButtonPresenterStory extends Story<ButtonPresenter, ButtonPresenterArgs> {
  ButtonPresenterStory({
    required super.name,
    super.setup,
    ButtonPresenterArgs? args,
    ArgsBuilder<ButtonPresenter, ButtonPresenterArgs>? argsBuilder,
  }) : super(
          args: args ?? ButtonPresenterArgs(),
          argsBuilder: argsBuilder ??
              (
                context,
                args,
              ) =>
                  ButtonPresenter(key: args.key?.resolve(context)),
        );
}

class ButtonPresenterArgs extends StoryArgs<ButtonPresenter> {
  ButtonPresenterArgs({Arg<Key>? key}) : this.key = key?.init(name: 'key');

  ButtonPresenterArgs.fixed({Key? key})
      : this.key = key == null ? null : Arg.fixed(key);

  final Arg<Key>? key;

  @override
  List<Arg?> get list => [key];
}
