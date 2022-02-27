import * as React from 'react';
import { View } from 'react-native';
import { DataTable } from 'react-native-paper';

const MyComponent = ({ theme }) => {
  const items = [
    {
      'name': 'Frozen yogurt',
      'cal': 159,
      'fat': 6.0
    },
    {
      'name': 'Ice cream sandwich',
      'cal': 237,
      'fat': 8
    },
    {
      "name": "Mathias Heaney",
      "cal": 56347,
      "fat": 813
    },
    {
      "name": "Teresa Friesen",
      "cal": 49,
      "fat": 770
    },
    {
      "name": "Brisa Dickinson I",
      "cal": 72,
      "fat": 275223475
    },
    {
      "name": "Dr. Lia Wisozk",
      "cal": 645109,
      "fat": 77928
    },
    {
      "name": "Ella Ratke V",
      "cal": 51197,
      "fat": 865
    },
    {
      "name": "Claude Jast",
      "cal": 84778643,
      "fat": 87331
    },
    {
      "name": "Mrs. Estella Swift IV",
      "cal": 62839,
      "fat": 4
    },
    {
      "name": "Dr. Bernie Rodriguez V",
      "cal": 428411,
      "fat": 27453580
    }
  ];
  const optionsPerPage = [2, 3, 4];
  const [page, setPage] = React.useState<number>(0);
  const [itemsPerPage, setItemsPerPage] = React.useState<number>(optionsPerPage[0]);
  const [pages, setPages] = React.useState<number>(items.length / itemsPerPage);

  React.useEffect(() => {
    setPage(0);
  }, [itemsPerPage]);

  return (
    <View style={{ padding: 10 }}>
      <DataTable>
        <DataTable.Header theme={theme}>
          <DataTable.Title theme={theme}>Dessert</DataTable.Title>
          <DataTable.Title numeric theme={theme}>Calories</DataTable.Title>
          <DataTable.Title numeric theme={theme}>Fat</DataTable.Title>
        </DataTable.Header>

        {items.map((item) => (
          <DataTable.Row theme={theme} key={item.name}>
            <DataTable.Cell theme={theme}>{item.name}</DataTable.Cell>
            <DataTable.Cell numeric theme={theme}>{item.cal}</DataTable.Cell>
            <DataTable.Cell numeric theme={theme}>{item.fat}</DataTable.Cell>
          </DataTable.Row>
        ))}

        <DataTable.Pagination
          page={page}
          numberOfPages={pages}
          onPageChange={(page) => setPage(page)}
          numberOfItemsPerPage={3}
          numberOfItemsPerPageList={optionsPerPage}
          theme={theme}
        />
      </DataTable>
    </View>
  );
}

export default MyComponent;