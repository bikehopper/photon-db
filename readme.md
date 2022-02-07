# Bikehopper Photon (geocoder)

Run the following command to download Photon jar file to src. Update the version on the path based on what you need from their [release](https://github.com/komoot/photon/releases).

```
curl -LJO 'https://github.com/komoot/photon/releases/download/0.3.5/photon-0.3.5.jar' --output-dir ./src
```

## Getting Started

Build the project using: `docker build -q -f Dockerfile -t bikehopper-photon:dev .`
Start the container with: `docker run -p 2322:2322 -v /Users/andy/projects/bikehopper-photon/photon_data:/usr/app/photon_data --rm -it bikehopper-photon:dev`
