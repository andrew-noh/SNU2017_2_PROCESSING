class GPU {

  int gpuLevel;
  int priceInUSD;
  float priceInBTC;
  float baseMultiplier;

  GPU(int _gpuLevel) {
    switch (_gpuLevel) {
    case 1:
      gpuLevel = 1;
      priceInUSD = 5;
      priceInBTC = 0.02;
      baseMultiplier = 0.0005;
      break;
    case 2:
      gpuLevel = 2;
      priceInUSD = 20;
      priceInBTC = 0.04;
      baseMultiplier = 0.00000010;
      break;
    case 3:
      gpuLevel = 3;
      priceInUSD = 50;
      priceInBTC = 0.08;
      baseMultiplier = 0.00000015;
      break;
    case 4:
      gpuLevel = 4;
      priceInUSD = 100;
      priceInBTC = 0.16;
      baseMultiplier = 0.00000020;
      break;
    case 5:
      gpuLevel = 5;
      priceInUSD = 200;
      priceInBTC = 0.30;
      baseMultiplier = 0.00000025;
      break;
    }
  }
  
  
  //Get multiplier of current level gpu
  float multiplier(){
    return baseMultiplier;
  }
  
  //Return price of current level GPU
  int priceUSD(){
   return priceInUSD; 
  }
  
  float priceBTC(){
    return priceInBTC;
  }
  
}