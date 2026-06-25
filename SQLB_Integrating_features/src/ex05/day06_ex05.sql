COMMENT ON TABLE person_discounts IS
    'Table storing discount information assigned to customers based on their orders in pizzerias';

COMMENT ON COLUMN person_discounts.id IS
    'Unique identifier of the discount record';
COMMENT ON COLUMN person_discounts.person_id IS
    'Identifier of the customer receiving the discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS
    'Identifier of the pizzeria where the discount is applied';
COMMENT ON COLUMN person_discounts.discount IS
    'Discount percentage based on number of orders: 1 order - 10.5%, 2 orders - 22%, more than 2 orders - 30%';