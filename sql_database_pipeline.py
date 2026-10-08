import dlt
from dlt.sources.sql_database import sql_database

def load_data():
    source = sql_database(
        schema='e_commerce',
        table_names=['customer', 'ecom_sales', 'product', 'region'],
        reflection_level='full'
    ).parallelize()

    pipeline = dlt.pipeline(
        pipeline_name='e_commerce_data_pipeline',
        destination='snowflake',
        dataset_name='e_commerce'
    )

    load_info = pipeline.run(source, write_disposition='replace')

    print(load_info)

if __name__ == "__main__":
    load_data()

    