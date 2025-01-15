// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_switch.stories.dart';

// **************************************************************************
// StoryGenerator
// **************************************************************************

final OptionSwitchComponent = LeafComponent<OptionSwitch, OptionSwitchArgs>(
  meta: meta,
  story: $Primary,
);
typedef OptionSwitchScenario = Scenario<OptionSwitch, OptionSwitchArgs>;

class OptionSwitchStory extends Story<OptionSwitch, OptionSwitchArgs> {
  OptionSwitchStory({
    required super.name,
    super.setup,
    OptionSwitchArgs? args,
    ArgsBuilder<OptionSwitch, OptionSwitchArgs>? argsBuilder,
  }) : super(
          args: args ?? OptionSwitchArgs(),
          argsBuilder: argsBuilder ??
              (
                context,
                args,
              ) =>
                  OptionSwitch(
                    key: args.key?.resolve(context),
                    label: args.label.resolve(context),
                    initialValue: args.initialValue.resolve(context),
                    onChanged: args.onChanged?.resolve(context),
                  ),
        );
}

class OptionSwitchArgs extends StoryArgs<OptionSwitch> {
  OptionSwitchArgs({
    Arg<Key>? key,
    Arg<String> label = const StringArg(''),
    Arg<bool> initialValue = const BoolArg(false),
    Arg<void Function(bool)>? onChanged,
  })  : this.key = key?.init(name: 'key'),
        this.label = label.init(name: 'label'),
        this.initialValue = initialValue.init(name: 'initialValue'),
        this.onChanged = onChanged?.init(name: 'onChanged');

  OptionSwitchArgs.fixed({
    Key? key,
    String label = '',
    bool initialValue = false,
    void Function(bool)? onChanged,
  })  : this.key = key == null ? null : Arg.fixed(key),
        this.label = Arg.fixed(label),
        this.initialValue = Arg.fixed(initialValue),
        this.onChanged = onChanged == null ? null : Arg.fixed(onChanged);

  final Arg<Key>? key;

  final Arg<String> label;

  final Arg<bool> initialValue;

  final Arg<void Function(bool)>? onChanged;

  @override
  List<Arg?> get list => [
        key,
        label,
        initialValue,
        onChanged,
      ];
}
