import Hero from '../components/Hero';
import About from '../components/About';
import Tokenomics from '../components/Tokenomics';
import HowToBuy from '../components/HowToBuy';
import Roadmap from '../components/Roadmap';
import Team from '../components/Team';
import Contact from '../components/Contact';

export default function Home() {
  return (
    <>
      <Hero />
      <About />
      <Tokenomics />
      <HowToBuy />
      <Roadmap />
      <Team />
      <Contact />
    </>
  );
}