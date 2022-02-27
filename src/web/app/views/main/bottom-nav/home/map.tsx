import React from "react"
import { View, StyleSheet, useWindowDimensions } from "react-native"
import { ZoomableMap, Geographies, Geography, Marker, Markers, ComposableMap } from "react-native-simple-maps"
import Svg from "react-native-svg"

const geoFile = "https://raw.githubusercontent.com/zcreativelabs/react-simple-maps/master/topojson-maps/world-110m.json";
const FILL_COLOR = "#6A717C";
const STROKE_COLOR = "#363E43";
const MARKER_ICON_SIZE = 21;
const LONG_PRES_DELAY = 2;

interface propTypes {
  markers: [{ coordinate: number, id: number }] | [];
  enableZoom: boolean,
}

const MapComponent = (props) => {
  const styles = StyleSheet.create({
    container: {
      paddingTop: 15,
      width: '100%',
      alignItems: "center",
      justifyContent: "center",
      position: "relative",
      overflow: "hidden",
      zIndex: -100,
    },
    mapWrapper: {
      flex: 1
    },
  });

  const { width, height } = useWindowDimensions();

  props = {
    markers: [],
    enableZoom: true,
  } as propTypes;

  const ProjectionConfig = {
    yOffset: width >= 1023 ? 20 : 0,
    precision: 0.1,
    scale:
      width < 200 ? 40 :
      width < 300 ? 50 :
      width < 400 ? 70 :
      width < 500 ? 90 :
      width < 600 ? 100 :
      width < 800 ? 120 :
      width < 900 ? 140 :
      width < 1000 ? 160 : 170,
    rotation: [-1, 0, 0],
    projection: "geoConicEqualArea"
  }

  const _onLongPress = (id, nativeEvent, geo) => {
    console.log("onLongPress")
  }

  const _onPressOut = (...args) => console.log("onPressOut")

  const _renderGeographies = (geographies, projection) => {
    let count = 0;
    return geographies.map(geography => {
      let id;
      count++;
      geography.properties.HASC_1 ? id = geography.properties.HASC_1 : id = count;
      const style = {
        fill: FILL_COLOR,
        stroke: STROKE_COLOR,
        strokeWidth: 0.75,
        outline: "none",
        fillRule: "evenodd",
      }

      return (
        <Geography
          key={id}
          onPressIn={(geo, event) => _onLongPress(id, event.nativeEvent, geo)}
          onPressOut={_onPressOut}
          delayLongPress={LONG_PRES_DELAY}
          geography={geography}
          projection={projection}
          style={{
            default: style,
            pressed: style,
          }}
        />
      )
    });
  }

  const _renderMarker = (marker, i) => (
    <Marker key={marker.id || i} marker={marker}>
      <Svg
        width={MARKER_ICON_SIZE}
        height={MARKER_ICON_SIZE}
        viewBox={`0 0 ${MARKER_ICON_SIZE} ${MARKER_ICON_SIZE}`}
        fill="none"
      >
        <Svg.Circle cx={MARKER_ICON_SIZE / 2} cy={MARKER_ICON_SIZE / 2} r={MARKER_ICON_SIZE / 2} fill="#FF6464" />
      </Svg>
    </Marker>
  )

  return (
    <View style={styles.container} >
      <View style={styles.mapWrapper}>
        <ZoomableMap
          projectionConfig={ProjectionConfig}
          canvasStyle={{ 
            backgroundColor: "transparent",
            transform: null
          }}
          viewStyle={{ 
            backgroundColor: "transparent",
            transform: null
          }}
          disabled={true}
        >
          <Geographies geography={geoFile} disableOptimization={false}>
            {(geographies, projection) => _renderGeographies(geographies, projection)}
          </Geographies>
          <Markers>{props.markers.map(_renderMarker)}</Markers>
        </ZoomableMap>
      </View>
    </View>
  );
}

export default MapComponent;