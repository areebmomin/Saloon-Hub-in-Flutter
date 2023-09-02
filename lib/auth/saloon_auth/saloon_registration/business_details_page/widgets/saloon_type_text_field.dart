part of '../business_details_page.dart';

class SaloonTypeTextField extends StatefulWidget {
  const SaloonTypeTextField({super.key});

  @override
  State<SaloonTypeTextField> createState() => _SaloonTypeTextFieldState();
}

class _SaloonTypeTextFieldState extends State<SaloonTypeTextField> {
  late var cubit = context.read<SaloonRegistrationCubit>();
  String? selectedValue = Strings.saloonTypes.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 19),
          child: RichText(
            text: const TextSpan(
              text: Strings.type,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: AppColors.headingTextColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: Strings.asterisk,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 19, right: 20, top: 9),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.inputFieldBackground,
              border: TextFieldConstants.curvedUnderlineInputBorder,
              enabledBorder: TextFieldConstants.curvedUnderlineInputBorder,
              focusedBorder: TextFieldConstants.curvedUnderlineInputBorder,
              hintText: Strings.businessAddressHint,
              hintStyle: TextStyleConstants.textFieldHintStyle,
              suffixIcon: DropdownButtonFormField(
                value: selectedValue,
                onChanged: (newValue) {
                  cubit.data.type = newValue ?? '';
                  setState(() {
                    selectedValue = newValue;
                  });
                },
                items: Strings.saloonTypes
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColors.headingTextColor,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: AppColors.inputText,
            ),
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
          ),
        ),
      ],
    );
  }
}
