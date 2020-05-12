import React from "react"
import PropTypes from "prop-types"
import {
  DetailsList,
  SelectionMode,
} from 'office-ui-fabric-react/lib/DetailsList';

const items = [
  {
    licenseName: 'foo',
    name: 'tarou',
    datetime: '2019-4-1',
  }
];


const LicenseTable = ({ items }) => {
  return (
      <>
      <DetailsList
        items={items}
        selectionMode={SelectionMode.none}
      />
      </>
  );
}

LicenseTable.defaultProps = {
  items: items
}

LicenseTable.propTypes = {
  items: PropTypes.Array
};

export default LicenseTable
