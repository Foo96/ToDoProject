import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:todoapp/Helper/ThemeHelper.dart';
import 'package:todoapp/View/widget/CustomText.dart';
import 'package:todoapp/generated/l10n.dart';

class CustomCircleProgressBar extends StatelessWidget {
  const CustomCircleProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: true,
          ticksPosition: ElementsPosition.outside,
          tickOffset: 10,
          majorTickStyle: const MajorTickStyle(
            color: CustomColor.colorTransparent,
            length: 0.05,
            thickness: 5,
            lengthUnit: GaugeSizeUnit.factor
          ),
          minorTickStyle: const MinorTickStyle(color:CustomColor.colorTransparent),
          pointers: const <GaugePointer>[
            RangePointer(
              value: 20,
              cornerStyle: CornerStyle.bothCurve,
              width: 0.05,
              sizeUnit: GaugeSizeUnit.factor,
              color: CustomColor.colorSuccess
            ),
            MarkerPointer(
              value: 20,
              enableAnimation: true,
              markerWidth: 15,
              markerHeight: 15,
              markerType: MarkerType.circle,
              color: CustomColor.colorWhite,
              animationType: AnimationType.linear
            )
          ],
          //    WHITE LINE
          axisLineStyle: const AxisLineStyle(
            thickness: 0.05,
            cornerStyle: CornerStyle.bothCurve,
            color: Colors.white,
            thicknessUnit: GaugeSizeUnit.factor
          ),
          //     MIDDLE PART
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              positionFactor: 0,
              angle: 90,
              widget: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 200.0,
                    height: 200.0,
                    padding: const EdgeInsets.all(10),
                    //decoration: new BoxDecoration(shape: BoxShape.circle, border: Border.all(width:2.5,color: uRewardsController.uDailyCheckStatus.value.isChecked ? ColorConfig.ColorGrey : ColorConfig.ColorWhite)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CustomText(text: S.of(context).DailyPlan, style: ThemeHelper.customTS(color: CustomColor.colorWhite, weight: CustomWeight.SB, size: CustomSize.L)),
                        // const SizedBox(height: 5),
                        CustomText(text: "30 %", style: ThemeHelper.customTS(color: CustomColor.colorWhite, weight: CustomWeight.DEB, size: CustomSize.D2EL)),
                        const SizedBox(height: 5),
                        CustomText(text: S.of(context).CompletedQty(3, 10), style: ThemeHelper.customTS(color: CustomColor.colorWhite, weight: CustomWeight.SB, size: CustomSize.M), textAlign: TextAlign.center)
                      ],
                    )
                    )
                  
                ]
              )
            )
          ]
        )
      ]
    );
  }
}



class CustomLinearProgressBar extends StatelessWidget {
  final double progress;

  const CustomLinearProgressBar({
    Key? key, required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfLinearGauge(
      minimum: 0.0,
      maximum: 100.0,
      orientation: LinearGaugeOrientation.horizontal,
      minorTickStyle: const LinearTickStyle(length: 0, color: Colors.transparent),
      majorTickStyle: const LinearTickStyle(length: 0, color: Colors.transparent),
      axisLabelStyle: const TextStyle(fontSize: 12.0, color: Colors.transparent),
      axisTrackStyle: const LinearAxisTrackStyle(
        color: CustomColor.colorWhite,
        edgeStyle: LinearEdgeStyle.bothCurve,
        thickness: 10.0,
        borderColor: Colors.transparent
      ),
      barPointers: <LinearBarPointer>[
        LinearBarPointer(
          edgeStyle: LinearEdgeStyle.bothCurve,
          value: progress,
          thickness: 10,
          color: CustomColor.colorSuccess.withOpacity(1)
        )
      ]
    );
  }
}
