import { type Payment, columns } from "./columns";
import { DataTable } from "./data-table";

function getData(): Payment[] {
  return [
    {
      id: "728ed52f",
      amount: 100,
      status: "pending",
      email: "m@example.com",
    },
    {
      id: "82a3f9c1",
      amount: 75,
      status: "processing",
      email: "n@example.com",
    },
    {
      id: "a4b5c6d7",
      amount: 50,
      status: "pending",
      email: "o@example.com",
    },
    {
      id: "b8e9f0a2",
      amount: 200,
      status: "pending",
      email: "p@example.com",
    },
    {
      id: "c3d4e5f6",
      amount: 150,
      status: "success",
      email: "q@example.com",
    },
    {
      id: "d7e8f9a1",
      amount: 120,
      status: "pending",
      email: "r@example.com",
    },
    {
      id: "e2f3a4b5",
      amount: 90,
      status: "failed",
      email: "s@example.com",
    },
    {
      id: "f6g7h8i9",
      amount: 180,
      status: "pending",
      email: "t@example.com",
    },
    {
      id: "j0k1l2m3",
      amount: 60,
      status: "failed",
      email: "u@example.com",
    },
    {
      id: "n4o5p6q7",
      amount: 110,
      status: "pending",
      email: "v@example.com",
    },
    {
      id: "12345678",
      amount: 85,
      status: "pending",
      email: "w@example.com",
    },
    {
      id: "23456789",
      amount: 95,
      status: "processing",
      email: "x@example.com",
    },
    {
      id: "34567890",
      amount: 120,
      status: "pending",
      email: "y@example.com",
    },
    {
      id: "45678901",
      amount: 210,
      status: "pending",
      email: "z@example.com",
    },
    {
      id: "56789012",
      amount: 160,
      status: "success",
      email: "aa@example.com",
    },
    {
      id: "67890123",
      amount: 135,
      status: "pending",
      email: "bb@example.com",
    },
    {
      id: "78901234",
      amount: 70,
      status: "failed",
      email: "cc@example.com",
    },
    {
      id: "89012345",
      amount: 155,
      status: "pending",
      email: "dd@example.com",
    },
    {
      id: "90123456",
      amount: 45,
      status: "failed",
      email: "ee@example.com",
    },
    {
      id: "01234567",
      amount: 125,
      status: "pending",
      email: "ff@example.com",
    },
  ];
}

export default function DemoPage() {
  //   const data = await getData();

  return (
    <div className="container mx-auto py-10">
      <DataTable columns={columns} data={getData()} />
    </div>
  );
}
