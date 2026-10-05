import RedButton from "./RedButton.jsx";
import {Button, Card, CardBody, CardSubtitle, CardText, CardTitle} from "reactstrap";

const LanternsCard = ({lantern}) =>{

    // we can destructure our props directly inside as a params
    // let first_name = props.first_name
    // let last_name = props.last_name
    // let {first_name, last_name} = props

    return (
        <div>
            {/*<h2>Lantern Card</h2>*/}
            {/*<p>First Name: {lantern.firstName}</p>*/}
            {/*<p>Last Name: {lantern.lastName}</p>*/}
            {/*<p>Ring Charge: {lantern.ringCharge}</p>*/}
            {/*<p>{lantern.firstName} is {lantern.isVillain ? "not" : ""} a Villain </p>*/}
            {/*/!*<Button color="danger">Danger!</Button>*!/*/}
            {/*<RedButton/>*/}
            <Card style={{ width: '18rem' }}>
                <img
                    alt="Sample"
                    src="https://picsum.photos/300/200"
                />
                <CardBody
                    style={{
                        backgroundImage: `linear-gradient(to right, ${lantern.corpsColor}, aquamarine)`
                    }}
                >
                    <CardTitle tag="h5">
                        {lantern.firstName} {lantern.lastName}
                    </CardTitle>
                    <CardSubtitle
                        className="mb-2 text-muted"
                        tag="h6"
                    >
                        {lantern.corpsColor.toLocaleUpperCase()} Lantern
                    </CardSubtitle>
                    <CardText>
                        Some quick example text to build on the card title and make up the bulk of the card‘s content.
                    </CardText>
                    <Button>
                        Button
                    </Button>
                </CardBody>
            </Card>
        </div>
    )
}

export default LanternsCard;