# 머신러닝 flask 구현
# 시작 명령어 flask --app main run --host=0.0.0.0 --port=5000

from flask import Flask, request, jsonify
import pickle
import pymysql
import collections


#  각 카테고리의 등장 횟수를 세기 위해 Counter 사용

from flask_cors import CORS  # 추가
app = Flask(__name__)
# CORS 설정
CORS(app, resources={r"/*": {"origins": "*"}})

# 저장된 모델 로드 역직렬화 과정
# 바이트 스트림을 다시 Python 객체로 변환할 수 있습니다
with open('bayesian_filter_model.pkl', 'rb') as f:
    bf = pickle.load(f)

# 저장된 모델 로드 (세분화)
with open('bayesian_filter_model2.pkl', 'rb') as f:
    bf2 = pickle.load(f)

# 저장된 모델 로드 (세분화 더 세분화)
with open('titles_and_categories.pkl', 'rb') as f:
    bf3 = pickle.load(f)

@app.route('/')
def home():
    return "Bayesian Filter +  Flask"

@app.route('/predict', methods=['post'])
def predict():
    data = request.json  # JSON 형식으로 데이터 받기
    id = data['id']
    # mysql 연결
    conn = pymysql.connect(host='192.168.0.210',
                           port=3306,
                           user='seoulinfo',
                           password='seoul',
                           db='seoulinfo',
                           charset='utf8')

    cursor = conn.cursor()

    cursor.execute('select productsearch_keyword '
                   'from product_search where member_id = %s', id)
    rows = cursor.fetchall()

    if not rows:
        # 결과가 없는 경우 처리할 코드 작성
        return jsonify({'prediction': 'null'})

    mldata = []
    for row in rows:
        predicted_category = bf.predict(row[0])
        mldata.append(predicted_category[0])

    counter = collections.Counter(mldata)

    most_common_category = counter.most_common(1)[0][0]                 # 가장 많이 등장한 카테고리
    print(most_common_category)
    return jsonify({'prediction': most_common_category})                # 가장 많이 나온 카테고리 json 형식으로 반환


# 구별 검색어 기반 ml
@app.route('/areaSearchPredict', methods=['post'])
def areaSearchPredict():
    data = request.json  # JSON 형식으로 데이터 받기
    area = data['area']
    # mysql 연결
    conn = pymysql.connect(host='192.168.0.210',
                           port=3306,
                           user='seoulinfo',
                           password='seoul',
                           db='seoulinfo',
                           charset='utf8')

    cursor = conn.cursor()

    if area == "전체":
        cursor.execute('SELECT productsearch_keyword FROM product_search')
    else:
        cursor.execute('select productsearch_keyword '
                       'from product_search where productsearch_area = %s', area)

    rows = cursor.fetchall()

    if not rows:
        # 결과가 없는 경우 처리할 코드 작성
        return jsonify({'prediction': 'null'})


    mldata = []
    for row in rows:
        predicted_category = bf.predict(row[0])
        mldata.append(predicted_category[0])


    counter = collections.Counter(mldata)

    most_common_category = counter.most_common(1)[0][0]
    print("areaSearchPredict", most_common_category)

    return jsonify({'prediction': most_common_category})



# 유사상품 구현
@app.route('/productDetail2', methods=['post'])
def productDetail2():
    data = request.json  # JSON 형식으로 데이터 받기
    title = data['title']
    cate = data['cate']
    area = data['area']

    predicted_category = bf3.predict(title)[0]
    print("CATE", predicted_category)
    # mysql 연결
    conn = pymysql.connect(host='192.168.0.210',
                           port=3306,
                           user='seoulinfo',
                           password='seoul',
                           db='seoulinfo',
                           charset='utf8')

    cursor = conn.cursor()

    if area == "전체":
        # If area is "전체", select all records
        cursor.execute('select sale_name,sale_id '
                       'from product_sale where sale_cate = %s  '
                       'and sale_status != %s', (cate, '판매완료'))
    else:
        # Otherwise, filter by the given area
        cursor.execute('select sale_name,sale_id '
                       'from product_sale where sale_cate = %s  '
                       'and sale_status != %s and sale_area =%s', (cate, '판매완료',area))

    rows = cursor.fetchall()

    if not rows:
        # 결과가 없는 경우 처리할 코드 작성
        return jsonify({'prediction': 'null'})

    mldata = []
    sale_id = []
    for row in rows:
        predicted_category2 = bf3.predict(row[0])
        mldata.append(predicted_category2[0])
        if predicted_category == predicted_category2[0]:
            sale_id.append(row[1])

    print(mldata)
    print(sale_id)

    return jsonify({'prediction': sale_id})


@app.route('/searchProduct', methods=['post'])
def searchProduct():
    data = request.json  # JSON 형식으로 데이터 받기
    search = data['search']
    area = data['area']

    predicted_category = bf2.predict(search)[0]
    print("CATE", predicted_category)
    # mysql 연결
    conn = pymysql.connect(host='192.168.0.210',
                           port=3306,
                           user='seoulinfo',
                           password='seoul',
                           db='seoulinfo',
                           charset='utf8')

    cursor = conn.cursor()

    if area == "전체":
        # If area is "전체", select all records
        cursor.execute('select sale_name,sale_id '
                       'from product_sale where sale_status != %s', ('판매완료'))
    else:
        # Otherwise, filter by the given area
        cursor.execute('select sale_name,sale_id '
                       'from product_sale where sale_status != %s and sale_area =%s', ('판매완료',area))

    rows = cursor.fetchall()

    if not rows:
        # 결과가 없는 경우 처리할 코드 작성
        return jsonify({'prediction': 'null'})

    mldata = []
    sale_id = []
    sale_cate= []
    for row in rows:
        predicted_category2 = bf2.predict(row[0])
        mldata.append(predicted_category2[0])
        if predicted_category == predicted_category2[0]:
            sale_id.append(row[1])
            sale_cate.append(row[0])

    print(mldata)
    print(sale_id)
    print(sale_cate)

    return jsonify({'prediction': sale_id})



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True) # 외부 접근 가능하게

