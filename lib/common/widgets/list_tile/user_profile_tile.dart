import 'package:d_store/common/widgets/images/t_circular_image.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        image: TImage.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Dipesh Dhungana',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        'dipeshdhungana17@gmail.com',
        overflow: TextOverflow.ellipsis,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit, color: TColors.white,)),
    );
  }
}
