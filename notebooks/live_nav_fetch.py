import requests
import pandas as pd

url = 'https://api.mfapi.in/mf/'
mf_schemes={
    "SBI_Bluechip": 125497,
    "Aditya_Birla_Sun_Life_Mutual_Fund": 119551, 
    "Axis_Mutual_Fund": 120503, 
    "Nippon_Large_Cap": 118632, 
    "HDFC_Mutual_Fund": 119092,
    "quant_Mutual_Fund": 120841
}


for key, value in mf_schemes.items():
    amfiCode = mf_schemes.get(key)
    res = requests.get(f"{url}{amfiCode}")
    data = res.json()
    # print(data)   data - {metadata:{},
    #                       data:[{},{}],
    #                       status: "success"}


    df = pd.DataFrame(data['data'])
    # df.set_index(f"{key}")
    df['amfi_code'] = amfiCode            #inserting amfi_code column
    df = df[['amfi_code','date','nav']]   #reordering columns
    # print(data['data'][0])

    print(df)
    df.to_csv(f"../data/raw/amfi_live_nav_history_data/{key}_nav_history.csv" , index= False)